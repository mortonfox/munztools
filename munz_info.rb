#!/usr/bin/env ruby

# frozen_string_literal: true

# Retrieve detailed information on a specific Munzee.

require_relative 'munzee_api'
require 'optparse'

def parse_cmdline
  args = {}

  optp = OptionParser.new

  optp.banner = "Usage: #{File.basename($PROGRAM_NAME)} [options] munzee-url"

  optp.separator <<~ENDS

    Retrieve detailed information on a specific Munzee.

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

def conv_coord coordstr, dirs
  coord = coordstr.to_f
  dir = dirs[coord.negative? ? 1 : 0]
  coord = coord.abs
  degs = coord.floor
  mins = (coord - degs) * 60
  "#{dir} #{degs} #{mins.round(3)} / #{coordstr}"
end

def show_info munz, url
  result = munz.post('/munzee/', url: url, closest: 0)
  result.each { |k, v|
    valstr = case k
             when 'latitude'
               conv_coord(v, 'NS')
             when 'longitude'
               conv_coord(v, 'EW')
             else
               v.is_a?(String) || v.is_a?(Numeric) ? v.to_s : v.inspect
             end
    puts format('%-28s %s', "#{k}:", valstr)
  }
end

args = parse_cmdline
munz = MunzeeAPI.new(force_login: args[:force_login])
show_info(munz, args[:munzee_url])

__END__
