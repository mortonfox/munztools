#!/usr/bin/env ruby

# frozen_string_literal: true

# Produce a CSV file containing magnetus capture info, ready to import into
# the Magnetus ROR sheet.

require 'csv'
require 'optparse'
require_relative 'munzee_api'

MAGNETUS_ID = 2306

def parse_cmdline
  args = {}

  optp = OptionParser.new

  optp.banner = "Usage: #{File.basename($PROGRAM_NAME)} startdate [enddate]"


  optp.separator <<~ENDS

Produce a CSV file containing magnetus capture info, ready to import into
the Magnetus ROR sheet.

  ENDS

  optp.on('-h', '-?', '--help', 'Option help') {
    puts optp
    exit
  }

  optp.on('-l', '--login', 'Ignore saved token and force a new login') {
    args[:force_login] = true
  }

  optp.separator <<~ENDS

    Recommended format for startdate and enddate is YYYY-MM-DD, e.g. 2017-06-15.
    If only startdate is specified, then enddate is the same as startdate, i.e.
    it is a one-day date range.
  ENDS

  optp.parse!

  if ARGV.empty?
    warn "Error: Date or date range needs to be specified!\n\n"
    warn optp
    exit 1
  end

  startdate = Date.parse(ARGV.shift)
  enddate = if ARGV.empty?
              # Just one date specified means a one-day range.
              startdate
            else
              Date.parse(ARGV.shift)
            end
  # Use sort in case the date range was specified in the wrong order.
  args[:startdate], args[:enddate] = [startdate, enddate].sort

  args
end

def run_day munz, date
  result = munz.post('/statzee/player/day/', day: date)

  magnetus_capped = result['captures'].select { |c| c['capture_type_id'].to_i == MAGNETUS_ID }

  magnetus_capped.map { |c|
    num = c['friendly_name'].split('#').last.to_i
    owner = c['username']
    points = c['points'].to_i
    { num: num, owner: owner, points: points }
  }
end

args = parse_cmdline
munz = MunzeeAPI.new(force_login: args[:force_login])

args[:startdate].upto(args[:enddate]) { |date|
  day_data = run_day(munz, date)

  day_data.each { |item|
    puts [date.to_s, item[:num], item[:owner], item[:points]].to_csv
  }

  sleep(0.5) # Short delay to keep within API limit.
}

__END__
