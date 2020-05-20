#!/usr/bin/env ruby

# frozen_string_literal: true

# Show info about bouncers on a specific Munzee.

require_relative 'munzee_api'
require 'optparse'
require 'time'

def parse_cmdline
  args = {}

  optp = OptionParser.new

  optp.banner = "Usage: #{File.basename($PROGRAM_NAME)} [options] munzee-url"

  optp.separator <<~ENDS

    Show info about bouncers on a specific Munzee.

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

def bouncers_on munz, url
  result = munz.post('/munzee/', url: url, closest: 0)

  puts <<-MSG
#{result['friendly_name']} (#{result['munzee_id']}) deployed by #{result['creator_username']} (#{result['creator_user_id']})
  MSG

  bouncers = result['bouncers']
  if !bouncers.is_a?(Array) || bouncers.empty?
    puts 'No bouncers on this munzee.'
    return
  end

  puts "There are #{bouncers.size} bouncers currently on this munzee:"
  puts

  bouncers.sort_by { |bouncer| bouncer['good_until'] }.each_with_index { |bouncer, i|
    puts <<-BOUNCERMSG
#{i + 1}: #{bouncer['unicorn_munzee']['friendly_name']} (#{bouncer['unicorn_munzee']['munzee_id']}) deployed by #{bouncer['unicorn_munzee']['creator_username']} (#{bouncer['unicorn_munzee']['creator_user_id']})
Landed on #{Time.at(bouncer['time_placed'].to_i)}
Good until #{Time.at(bouncer['good_until'].to_i)} (#{time_to(bouncer['good_until'])})

    BOUNCERMSG
  }
end

def time_to time
  time = Time.at(time.to_i) unless time.is_a?(Time)

  secs = (time - Time.now).floor
  return '0 seconds' if secs.zero?

  hours, secs = secs.divmod(3_600)
  mins, secs = secs.divmod(60)

  [plural(hours, 'hour'), plural(mins, 'minute'), plural(secs, 'second')].compact.join(' ')
end

def plural num, noun
  num == 1 ? "1 #{noun}" : "#{num} #{noun}s"
end

args = parse_cmdline
munz = MunzeeAPI.new(force_login: args[:force_login])
bouncers_on(munz, args[:munzee_url])

__END__

