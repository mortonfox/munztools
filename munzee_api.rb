# frozen_string_literal: true

# Wrapper for Munzee API.
# Requires oauth2 and launchy gems. (Run 'gem install oauth2 launchy')

require 'oauth2'
require 'webrick'
require 'launchy'

# Wrapper for Munzee API.
class MunzeeAPI
  DEFAULT_CONF_FILE = '~/.munztools.conf'
  DEFAULT_TOKEN_FILE = '~/.munztools.token'
  DEFAULT_PORT = 8557

  class HTTPError < StandardError
  end

  def initialize params = {}
    @conf_file = params[:conf_file] || DEFAULT_CONF_FILE
    @token_file = params[:token_file] || DEFAULT_TOKEN_FILE
    @port = params[:port] || DEFAULT_PORT
    @redirect_url = "http://localhost:#{@port}/oauth2/callback"

    load_config

    @token = nil
    @client = OAuth2::Client.new(@client_id, @client_secret,
                                 site: 'https://api.munzee.com',
                                 authorize_url: '/oauth',
                                 token_url: '/oauth/login',
                                 raise_errors: false)

    load_token unless params[:force_login]

    # If the token file cannot be read or the access token has expired or the
    # force_login parameter is true, authenticate with Munzee to get a new
    # access token.
    login if @token.nil? || @token.expired?
  end

  def post path, params = {}
    res = @token.post(path, body: "data=#{params.to_json}")
    raise HTTPError, "#{res.status} #{res.body}" if res.status != 200

    res.parsed['data']
  end

  private

  def load_config
    config = YAML.load_file(File.expand_path(@conf_file))

    %w[client_id client_secret].each { |key|
      raise "#{key} is missing from configuration file #{@conf_file}" unless config.key?(key)

      instance_variable_set("@#{key}", config[key])
    }
  end

  def load_token
    File.open(File.expand_path(@token_file)) { |io|
      token_hash = JSON.parse(io.read)
      @token = OAuth2::AccessToken.from_hash(@client, token_hash)
      @token.options[:header_format] = '%s'
    }
  rescue StandardError
    nil
  end

  def login
    url = @client.auth_code.authorize_url(redirect_uri: @redirect_url, scope: 'read')

    # Run a WEBrick server to catch the callback after the user authorizes the
    # app.
    log = WEBrick::Log.new($stdout, WEBrick::Log::ERROR)
    server = WEBrick::HTTPServer.new(Port: @port, Logger: log, AccessLog: [])

    auth_code = nil

    server.mount_proc('/oauth2/callback') { |req, res|
      code_param = req.query['code']
      if code_param
        auth_code ||= code_param
        res.body = 'Okay'
        raise WEBrick::HTTPStatus::OK
      else
        res.body = 'Missing code parameter'
        raise WEBrick::HTTPStatus::BadRequest
      end
    }

    # Suppress the favicon.ico error message.
    server.mount_proc('/favicon.ico') { raise WEBrick::HTTPStatus::NotFound }

    Thread.new { server.start }

    # Open the authorization URL and wait for the callback.
    Launchy.open(url)

    sleep(1) until auth_code

    server.shutdown

    token1 = @client.auth_code.get_token(auth_code, redirect_uri: @redirect_url)

    # Munzee returns the token two levels deep in the JSON response. Extract
    # the token and recreate our AccessToken.
    token_hash = token1.params['data']['token']

    @token = OAuth2::AccessToken.from_hash(@client, token_hash)
    @token.options[:header_format] = '%s'

    # Save the token to the token file.
    File.open(File.expand_path(@token_file), 'w') { |io|
      io.write(@token.to_hash.to_json)
    }
  end
end

__END__
