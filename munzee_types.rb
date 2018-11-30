# frozen_string_literal: true

require 'optparse'
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

def run_reports data
  puts "All Munzees:\n\n"
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

  virtuals = [
    'Virtual',
    'Virtual Blue',
    'Virtual Red',
    'Virtual Black',
    'Virtual Rainbow',
    'Virtual Forest Green',
    'Virtual Yellow',
    'Virtual Violet',
    'Virtual Green',
    'Virtual Orange',
    'Virtual Brown',
    'Virtual Indigo',
    'Virtual Turquoise Blue',
    'Virtual Pink',
    'Virtual Scarlet',
    'Virtual Plum',
    'Virtual Burnt Orange',
    'Virtual Blue Violet',
    'Virtual Robin Egg Blue',
    'Virtual Purple Mountains Majesty',
    'Virtual Gray',
    'Virtual Raw Sienna',
    'Virtual Orchid',
    'Virtual Wild Strawberry',
    'Virtual Blue Green',
    'Virtual Brick Red',
    'Virtual Granny Smith Apple',
    'Virtual Cornflower',
    'Virtual Dandelion',
    'Virtual Wisteria',
    'Virtual Cerulean',
    'Virtual Red Violet',
    'Virtual Silver',
    'Virtual Pacific Blue',
    'Virtual Tumbleweed',
    'Virtual Timberwolf',
    'Virtual Asparagus',
    'Virtual Yellow Green',
    'Virtual Cadet Blue',
    'Virtual Gold',
    'Virtual Red Orange',
    'Virtual Goldenrod',
    'Virtual Sea Green',
    'Virtual Chestnut',
    'Virtual Violet Red',
    'Virtual Periwinkle',
    'Virtual Olive Green',
    'Virtual Mahogany',
    'Virtual Magenta',
    'Virtual Bittersweet',
    'Virtual Tickle Me Pink',
    'Virtual Green Yellow',
    'Virtual Melon',
    'Virtual Apricot',
    'Virtual Macaroni and Cheese',
    'Virtual Carnation Pink',
    'Virtual Tan',
    'Virtual Mauvelous',
    'Virtual Spring Green',
    'Virtual Burnt Sienna',
    'Virtual Peach',
    'Virtual Salmon'
  ]

  puts "Virtuals:\n\n"
  report(data, virtuals)
  puts

  flats = [
    'Flat Rob',
    'Flat Matt',
    'Flat Lou',
    'Flat Hammock',
    'Gettysburg Flat Hammock',
    'MHQ Flat Matt',
    'MHQ Flat Rob',
    'Tower Bridge Flat Lou'
  ]

  puts "Flats:\n\n"
  report(data, flats)
  puts

  evolutions = [
    'Muscle Car',
    'Safari Bus',
    'Submarine',
    'Championship Horse',
    'Field',
    'Family',
    'Tomato',
    'Shark',
    'Bacon',
    'Tractor',
    'Barn',
    'King of the Jungle',
    'Treasure Chest',
    'Golden Carrot',
    'Milk',
    'Carrot',
    'Ear of Corn',
    'Peas',
    'Bones',
    'Eggs'
  ]

  puts "Evolutions:\n\n"
  report(data, evolutions)
  puts

  resellers = [
    'Munzee Madness Reseller',
    'DDCards Reseller',
    'NEGS Reseller',
    'Ruja Reseller',
    'MM Cocoa Beach Reseller',
    'GeoLoggers Reseller',
    'GeoStuff Reseller',
    'Laupe Reseller',
    'SCGS Reseller',
    'GeoHobbies Reseller'
  ]

  puts "Resellers:\n\n"
  report(data, resellers)
  puts

  elementals = [
    'Air Mystery',
    'Fire Mystery',
    'Ice Mystery',
    'Earth Mystery',
    'Water Mystery'
  ]

  puts "Elementals:\n\n"
  report(data, elementals)
  puts

  zodiacs = [
    'Gemini',
    'Virgo',
    'Aquarius',
    'Cancer',
    'Taurus',
    'Scorpio',
    'Pisces',
    'Libra',
    'Aries',
    'Leo',
    'Sagittarius',
    'Capricorn',
    'Dog Chinese Zodiac',
    'Pig Chinese Zodiac',
    'Rat Chinese Zodiac',
    'Ox Chinese Zodiac',
    'Tiger Chinese Zodiac',
    'Rabbit Chinese Zodiac',
    'Dragon Chinese Zodiac',
    'Snake Chinese Zodiac'
  ]

  puts "Zodiacs:\n\n"
  report(data, zodiacs)
  puts

  mythologicals = [
    'Pegasus',
    'Yeti',
    'Hydra',
    'Faun',
    'Cyclops',
    'Dragon',
    'Leprechaun',
    'The Unicorn',
    'Mermaid',
    'Fairy',
    'Wildfire Fairy',
    'Melusine Mermaid',
    'Retired Dragon',
    'Retired Leprechaun',
    'Retired Unicorn',
    'Dryad Fairy',
    'Dwarf Leprechaun',
    'Hippocamp Unicorn',
    'Battle Unicorn',
    'Retired Yeti',
    'Gnome Leprechaun',
    'Rainbow Unicorn',
    'Cherub',
    'Fire Pegasus',
    'Ice Dragon',
    'Retired Faun',
    'Sasquatch Yeti',
    'Chimera',
    'Hot Spring Mermaid',
    'Ogre',
    'Fairy Godmother',
    'Siren',
    'Retired Hydra',
    'Goblin Leprechaun',
    'Retired Pegasus',
    'Retired Cyclops'
  ]

  puts "Mythologicals:\n\n"
  report(data, mythologicals)
  puts

  pouch_creatures = %w[Tuli Vesi Muru]

  puts "Pouch Creatures:\n\n"
  report(data, pouch_creatures)
  puts
end

def parse_cmdline
  optp = OptionParser.new

  optp.banner = "Usage: #{File.basename($PROGRAM_NAME)} [options] htmlfile"

  optp.separator <<~ENDS

    Parse the global Munzee types web page and report on Munzee counts by type
    and category.

  ENDS

  optp.on('-h', '-?', '--help', 'Show this help message') {
    puts optp
    exit
  }

  optp.separator <<~ENDS

    Navigate to https://statzee.munzee.com/global/types/ (Requires premium
    membership) and save that web page. Pass the HTML file name as the first
    parameter to this script.
  ENDS

  optp.parse!

  if ARGV.empty?
    warn "Error: HTML file needs to be specified!\n\n"
    warn optp
    exit 1
  end

  ARGV.first
end

fname = parse_cmdline
data = File.open(fname) { |io| parse_html(io) }
run_reports(data)

__END__
