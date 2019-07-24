# frozen_string_literal: true

# Retrieve detailed information on the authenticated player.

require_relative 'munzee_api'
require 'optparse'

def parse_cmdline
  args = {}

  optp = OptionParser.new

  optp.banner = "Usage: #{File.basename($PROGRAM_NAME)} [options]"

  optp.separator <<~ENDS

    Retrieve detailed information on the authenticated player.

  ENDS

  optp.on('-h', '-?', '--help', 'Option help') {
    puts optp
    exit
  }

  optp.on('-l', '--login', 'Ignore saved token and force a new login') {
    args[:force_login] = true
  }

  optp.parse!

  args
end

def show_info munz
  result = munz.get('/user/current')
  result.each { |k, v|
    valstr = v.is_a?(String) || v.is_a?(Numeric) ? v.to_s : v.inspect
    puts format('%-35s %s', "#{k}:", valstr)
  }
end

args = parse_cmdline
munz = MunzeeAPI.new(force_login: args[:force_login])
show_info(munz)

__END__
