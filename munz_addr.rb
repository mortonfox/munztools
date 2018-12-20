# frozen_string_literal: true

# Reverse-geocode the coordinates of a Munzee to get its address.

require_relative 'munzee_api'
require 'optparse'
require 'json'
require 'rest-client'

def parse_cmdline
  args = {}

  optp = OptionParser.new

  optp.banner = "Usage: #{File.basename($PROGRAM_NAME)} [options] munzee-url"

  optp.separator <<~ENDS

    Reverse-geocode the coordinates of a Munzee to get its address.

  ENDS

  optp.on('-h', '-?', '--help', 'Option help') {
    puts optp
    exit
  }

  optp.on('-l', '--login', 'Ignore saved token and force a new login') {
    args[:force_login] = true
  }

  optp.separator <<~ENDS

    munzee-url can be the full web address, e.g. https://www.munzee.com/m/mortonfox/1742/
    or it can be a relative address on the Munzee site, e.g. /m/mortonfox/1742/
  ENDS

  optp.parse!

  if ARGV.empty?
    warn "Error: Munzee URL needs to be specified!\n\n"
    warn optp
    exit 1
  end

  args[:munzee_url] = ARGV.first

  args
end

CONF_FILE = '~/.munztools.conf'
BMK_KEY = 'bing_maps_key'

def fetch_bmk
  config = YAML.load_file(File.expand_path(CONF_FILE))
  raise "#{BMK_KEY} is missing from configuration file #{CONF_FILE}" unless config.key?(BMK_KEY)

  config[BMK_KEY]
end

def show_address munz, url
  result = munz.post('/munzee/', url: url, closest: 0)

  lat = result['latitude'].to_f
  lon = result['longitude'].to_f

  puts "#{lat}, #{lon}"

  key = fetch_bmk

  resp = RestClient.get("https://dev.virtualearth.net/REST/v1/Locations/#{lat},#{lon}",
                        params: { key: key })
  json = JSON.parse(resp.body)

  json['resourceSets'].each { |res_set|
    res_set['resources'].each { |res|
      puts res['name']
    }
  }
end

args = parse_cmdline
munz = MunzeeAPI.new(force_login: args[:force_login])
show_address(munz, args[:munzee_url])

__END__
