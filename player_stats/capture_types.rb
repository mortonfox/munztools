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
  by_count = keys.sort { |a, b|
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
end

args = parse_cmdline
munz = MunzeeAPI.new(force_login: args[:force_login])

data = fetch_data(munz)
run_reports(data)

__END__
