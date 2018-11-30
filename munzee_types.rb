# frozen_string_literal: true

require 'oga'
require 'rkelly'

def parse_js_data script
  js = RKelly::Parser.new.parse(script)
  js.each { |node|
    # Search for the first PropertyNode named 'data' in the object the script passes to Highcharts.
    # In the PropertyNode, there is an ArrayNode.
    # Each item in the array is an Element containing an ArrayNode.
    # The inner ArrayNode has two Element nodes.
    # The first Element contains a StringNode, which is the munzee type.
    # The second Element contains a NumberNode, which is the count of that munzee type.
    if node.is_a?(RKelly::Nodes::PropertyNode) && node.name == 'data'
      return node.value.value.map { |item|
        pair = item.value.value
        name, value = pair.map { |e| e.value.value }
        name = name.gsub(/\A'|'\Z/, '')
        [name, value]
      }.to_h
    end
  }
end

def parse_html io
  doc = Oga.parse_html(io)
  script = doc.at_css('body > script')
  parse_js_data(script.text)
end

def commaify num
  num.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
end

def report data, keys
  by_count = keys.sort { |a, b|
    if data[a] == data[b]
      a.downcase <=> b.downcase
    else
      data[b] <=> data[a]
    end
  }

  puts format('%4s %-35s %9s', '', 'Munzee Type', 'Count')
  puts '=' * 50
  total = 0
  by_count.each_with_index { |k, i|
    total += data[k]
    puts format('%3d: %-35s %9s', i + 1, k, commaify(data[k]))
  }
  puts '=' * 50
  puts format('%4s %-35s %9s', '', 'Total', commaify(total))
end

data = File.open('munzeetypes.html') { |io| parse_html(io) }

puts "All Munzees:\n\b"
report(data, data.keys)
puts

clan_weapons = [
  'Mace Munzee',
  'Crossbow',
  'Longsword Munzee',
  'Battle Axe Munzee',
  'Catapult',
  'The Hammer'
]

puts "Clan Weapons:\n\n"
report(data, clan_weapons)
puts

jewels = [
  'Diamond Munzee',
  'Aquamarine Munzee',
  'Ruby Munzee',
  'Virtual Emerald',
  'Topaz Munzee',
  'Pink Diamond',
  'Virtual Sapphire',
  'Virtual Amethyst'
]

puts "Jewels:\n\n"
report(data, jewels)
puts

destinations = [
  'Motel Munzee',
  'Hotel Munzee',
  'Virtual Resort',
  'Time Share Munzee'
]

puts "Destinations:\n\n"
report(data, destinations)
puts

places = [
  'POI Museum',
  'POI Sports',
  'POI Airport',
  'POI Historical Place',
  'POI Library',
  'POI Post Office',
  'POI Virtual Garden',
  'POI Unique Attraction',
  'POI Hospital',
  'POI First Responders',
  'POI Wildlife',
  'POI Cemetery',
  'POI University',
  'POI Faith Place'
]

puts "Places:\n\n"
report(data, places)
puts

__END__
