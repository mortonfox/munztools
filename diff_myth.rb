# frozen_string_literal: true

# Report how many different mythicals player has captured on each day.

require_relative 'munzee_api'
require 'set'
require 'optparse'

MYTH_TYPES = {
  505 => 'Unicorn',
  508 => 'Leprechaun',
  573 => 'Dragon',
  725 => 'Yeti',
  853 => 'Faun',
  953 => 'Hydra',
  1100 => 'Pegasus',
  1168 => 'Cyclops',
  1378 => 'Mermaid',
  1544 => 'Fairy'
}.freeze

def parse_cmdline
  args = {}

  optp = OptionParser.new

  optp.banner = "Usage: #{File.basename($PROGRAM_NAME)} [options] startdate [enddate]"

  optp.separator <<~ENDS

    Report how many different types of mythologicals the logged in player has
    captured on each given day.

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
    it's a one-day date range.
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

  all_capped = result['captures'].map { |c| c['capture_type_id'].to_i }
  myths_capped = MYTH_TYPES.keys.to_set & all_capped
  myth_names = myths_capped.map { |i| MYTH_TYPES[i] }.join(', ')

  puts "#{date}: #{myths_capped.size} types of mythologicals captured: #{myth_names}"
end

args = parse_cmdline
munz = MunzeeAPI.new(force_login: args[:force_login])
args[:startdate].upto(args[:enddate]) { |date|
  run_day(munz, date)
  sleep(0.5) # Short delay to keep within API limit.
}

__END__
