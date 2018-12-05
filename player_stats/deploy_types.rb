# frozen_string_literal: true

# Report on the logged in player's deploys by type and category.

require_relative '../munzee_api'
require_relative 'groups'
require_relative 'common'
require 'optparse'

def parse_cmdline
  args = {}

  optp = OptionParser.new

  optp.banner = "Usage: #{File.basename($PROGRAM_NAME)} [options]"

  optp.separator <<~ENDS

    Report on the logged in player's deploys by type and category.

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

def fetch_data munz
  result = munz.get('/user/current')
  username = result['username']

  result = munz.post('/statzee/player/deploys/types/', username: username)

  data = {}
  result['types'].each { |rec|
    data[rec['capture_type_id'].to_i] = {
      name: rec['name'],
      count: rec['munzees'].to_i
    }
  }
  data
end

def run_reports data
  puts "All Munzees:\n\n"
  report(data, data.keys)
  puts

  puts "Clan Weapons:\n\n"
  report(data, CLAN_WEAPONS)
  puts

  puts "Jewels\n\n"
  report(data, JEWELS)
  puts

  puts "Destinations\n\n"
  report(data, DESTINATIONS)
  puts

  puts "Rooms\n\n"
  report(data, ROOMS)
  puts

  puts "Places\n\n"
  report(data, PLACES)
  puts

  puts "Virtuals\n\n"
  report(data, VIRTUALS)
  puts

  puts "Flats\n\n"
  report(data, FLATS)
  puts

  puts "Evolutions\n\n"
  report(data, EVOLUTIONS)
  puts

  puts "Resellers\n\n"
  report(data, RESELLERS)
  puts

  puts "Elementals\n\n"
  report(data, ELEMENTALS)
  puts

  puts "Zodiacs\n\n"
  report(data, ZODIACS)
  puts

  puts "Mythologicals\n\n"
  report(data, MYTHOLOGICALS)
  puts

  puts "Pouch Creatures\n\n"
  report(data, POUCH_CREATURES)
  puts
end

args = parse_cmdline
munz = MunzeeAPI.new(force_login: args[:force_login])

data = fetch_data(munz)
run_reports(data)

__END__
