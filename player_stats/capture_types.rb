# frozen_string_literal: true

# Report on the logged in player's captures by type and category.

require_relative '../munzee_api'
require_relative 'groups'
require 'optparse'

def parse_cmdline
  args = {}

  optp = OptionParser.new

  optp.banner = "Usage: #{File.basename($PROGRAM_NAME)} [options]"

  optp.separator <<~ENDS

    Report on the logged in player's captures by type and category.

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

  result = munz.post('/statzee/player/captures/types/', username: username)

  data = {}
  result['types'].each { |rec|
    data[rec['capture_type_id'].to_i] = {
      name: rec['name'],
      count: rec['captures'].to_i
    }
  }
  data
end

def commaify num
  num.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
end

def report data, keys
  by_count = keys.select { |k| data.key?(k) }.sort { |a, b|
    if data[a][:count] == data[b][:count]
      data[a][:name].downcase <=> data[b][:name].downcase
    else
      data[b][:count] <=> data[a][:count]
    end
  }

  puts format('%4s %-45s %9s', '', 'Munzee Type', 'Count')
  puts '=' * 60
  total = 0
  by_count.each_with_index { |k, i|
    total += data[k][:count]
    puts format('%3d: %-45s %9s', i + 1, data[k][:name], commaify(data[k][:count]))
  }
  puts '=' * 60
  puts format('%4s %-45s %9s', '', 'Total', commaify(total))
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
