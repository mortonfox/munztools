# frozen_string_literal: true

# rubocop:disable Style/TrailingCommaInArrayLiteral

CLAN_WEAPONS = [
  52, # Mace
  53, # Longsword
  140, # Battle Axe
  306, # Hammer
  998, # Crossbow
  1248 # Catapult
].freeze

JEWELS = [
  40, # Diamond
  131, # Ruby
  148, # Virtual Emerald
  218, # Aquamarine
  242, # Topaz
  290, # Virtual Amethyst
  584, # Pink Diamond
  681, # Virtual Sapphire
  2361, # Virtual Citrine
  2362, # Virtual Onyx
].freeze

DESTINATIONS = [
  70, # Motel
  170, # Hotel
  470, # Virtual Resort
  970, # Time Share
  2145, # Treehouse
  2183, # Vacation Condo
  2356, # 2 Star Motel
  2358, # 3 Star Motel
  2426, # Skyland
].freeze

ROOMS = [
  71, # Motel Room
  171, # Hotel Room
  471, # Virtual Resort Room
  971, # Time Share Room
  2184, # Vacation Condo Room
  2357, # 2 Star Motel Room
  2359, # 3 Star Motel Room
].freeze

PLACES = [
  782, # Airport
  783, # Sports
  784, # University
  786, # Museum
  787, # Wildlife
  1339, # Historical Place
  1340, # Library
  1341, # First Responders
  1342, # Faith
  1486, # Hospital
  1487, # Post Office
  1488, # Cemetery
  1551, # Unique Attraction
  1631, # Virtual Garden
  1770, # Cinema
  1977, # Transportation
  1978, # Play Park
  2445, # Bank
  2446, # Beach
  2447, # Campground
  2448, # Golf
].freeze

VIRTUALS = [
  1409, # Virtual
  1410, # Virtual Rainbow
  1411, # Virtual Timberwolf
  1412, # Virtual Silver
  1413, # Virtual Gray
  1414, # Virtual Black
  1415, # Virtual Orchid
  1416, # Virtual Wisteria
  1417, # Virtual Purple Mountains Majesty
  1418, # Virtual Violet
  1419, # Virtual Plum
  1420, # Virtual Blue Violet
  1421, # Virtual Indigo
  1422, # Virtual Blue
  1423, # Virtual Cadet Blue
  1424, # Virtual Periwinkle
  1425, # Virtual Cornflower
  1426, # Virtual Blue Green
  1427, # Virtual Pacific Blue
  1428, # Virtual Cerulean
  1429, # Virtual Robin Egg Blue
  1430, # Virtual Indigo
  1431, # Virtual Turquoise Blue
  1432, # Virtual Sea Green
  1433, # Virtual Granny Smith Apple
  1434, # Virtual Green
  1435, # Virtual Forest Green
  1436, # Virtual Asparagus
  1437, # Virtual Olive Green
  1438, # Virtual Yellow Green
  1439, # Virtual Green Yellow
  1440, # Virtual Spring Green
  1441, # Virtual Gold
  1442, # Virtual Yellow
  1443, # Virtual Goldenrod
  1444, # Virtual Dandelion
  1445, # Virtual Orange
  1446, # Virtual Burnt Orange
  1447, # Virtual Orange
  1448, # Virtual Melon
  1449, # Virtual Pink
  1450, # Virtual Carnation Pink
  1451, # Virtual Mauvelous
  1452, # Virtual Salmon
  1453, # Virtual Tickle Me Pink
  1454, # Virtual Magenta
  1455, # Virtual Wild Strawberry
  1456, # Virtual Violet Red
  1457, # Virtual Red Violet
  1458, # Virtual Apricot
  1459, # Virtual Peach
  1460, # Virtual Macaroni and Cheese
  1461, # Virtual Tan
  1462, # Virtual Burnt Sienna
  1463, # Virtual Bittersweet
  1464, # Virtual Red Orange
  1465, # Virtual Scarlet
  1466, # Virtual Red
  1467, # Virtual Brick Red
  1468, # Virtual Mahogany
  1469, # Virtual Chestnut
  1470, # Virtual Tumbleweed
  1471, # Virtual Raw Sienna
  1472, # Virtual Brown
  1473 # Virtual Sepia
].freeze

FLATS = [
  353, # Flat Rob
  1015, # Flat Matt
  1338, # Flat Lou
  1581 # Flat Hammock
].freeze

EVOLUTIONS = [
  807, # Muscle Car
  809, # Penny-Farthing Bike
  808, # First Wheel
  839, # Safari Bus
  841, # Safari Van
  840, # Safari Truck
  744, # Submarine
  746, # Motorboat
  745, # Canoe
  702, # Championship Horse
  706, # Racehorse
  704, # Colt
  736, # Field
  739, # Potted Plant
  740, # Garden
  735, # Family
  737, # Farmer
  738, # Farmer and Wife
  658, # Tomato
  666, # Tomato Plant
  662, # Tomato Seed
  741, # Shark
  743, # Fish
  742, # Seaweed
  685, # Bacon
  699, # Piglet
  701, # Pig
  709, # Tractor
  732, # Plow
  731, # Hoe
  708, # Barn
  730, # Garden Shed
  729, # Lean-To Shed
  835, # King of the Jungle
  838, # Lion
  837, # Lion Cub
  1057, # Treasure Chest
  1055, # Coin
  1056, # Bag of Coins
  678, # Golden Carrot
  679, # Golden Carrot Seed
  680, # Golden Carrot Plant
  684, # Milk
  700, # Cow
  698, # Calf
  660, # Carrot
  668, # Carrot Plant
  664, # Carrot Seed
  659, # Ear of Corn
  667, # Corn Stalk
  663, # Corn Seed
  661, # Peas
  669, # Peas Plant
  665, # Peas Seed
  802, # Bones
  801, # Dinosaur
  800, # Egg
  703, # Eggs
  705, # Chick
  707, # Chicken
  1775, # Tulip Seed
  1776, # Tulip Germination
  1777, # Tulip Growth
  1778, # Tulip Bud
  1779, # Blue Tulip Blossom
  1780, # Pink Tulip Blossom
  1781, # White Tulip Blossom
  1782, # Rose Seed
  1783, # Rose Germination
  1784, # Rose Growth
  1785, # Rose Bud
  1786, # Red Rose Blossom
  1787, # Violet Rose Blossom
  1788, # White Rose Blossom
  1789, # Yellow Rose Blossom
  1790, # Lily Seed
  1791, # Lily Germination
  1792, # Lily Growth
  1793, # Lily Bud
  1794, # Pink Lily Blossom
  1795, # Violet Lily Blossom
  1796, # White Lily Blossom
  1798, # Carnation Seed
  1799, # Carnation Germination
  1800, # Carnation Growth
  1801, # Carnation Bud
  1802, # Pink Carnation Blossom
  1803, # Red Carnation Blossom
  1804, # Violet Carnation Blossom
  1805, # White Carnation Blossom
  1806, # Yellow Carnation Blossom
  1836, # Butterfly Egg
  1837, # Caterpillar
  1838, # Chrysalis
  1839, # Hatched Chrysalis
  1840, # Morpho Butterfly
  1841, # Monarch Butterfly
  1842, # Lime Butterfly
  2106, # Frog Egg
  2107, # Tadpole
  2108, # Pollywog
  2109, # Froglet
  2110, # Tree Frog
  2111, # Poison Dart Frog
  2112, # Tomato Frog
].freeze

RESELLERS = [
  513, # DDCards Reseller
  516, # MM Cocoa Beach Reseller
  510, # Munzee Madness Reseller
  515, # GeoLoggers Reseller
  601, # Laupe Reseller
  514, # NEGS Reseller
  511, # GeoStuff Reseller
  696, # SCGS Reseller
  512, # GeoHobbies Reseller
  550 # Ruja Reseller
].freeze

ELEMENTALS = [
  532, # Fire Mystery
  651, # Ice Mystery
  851, # Earth Mystery
  1020, # Water Mystery
  1086, # Air Mystery
  2391, # Electric Mystery
].freeze

ZODIACS = [
  319, # Cancer
  318, # Gemini
  317, # Taurus
  321, # Virgo
  314, # Aquarius
  313, # Capricorn
  312, # Sagittarius
  308, # Scorpio
  315, # Pisces
  322, # Libra
  316, # Aries
  320, # Leo
  1271, # Dog Chinese Zodiac
  1272, # Pig Chinese Zodiac
  1273, # Rat Chinese Zodiac
  1274, # Ox Chinese Zodiac
  1275, # Tiger Chinese Zodiac
  1276, # Rabbit Chinese Zodiac
  1277, # Dragon Chinese Zodiac
  1278, # Snake Chinese Zodiac
  1279, # Horse Chinese Zodiac
  1280, # Goat Chinese Zodiac
  1281, # Monkey Chinese Zodiac
  1282 # Rooster Chinese Zodiac
].freeze

MYTHOLOGICALS = [
  505, # The Unicorn
  508, # Leprechaun
  573, # Dragon
  725, # Yeti
  853, # Faun
  953, # Hydra
  1100, # Pegasus
  1118, # Rainbow Unicorn
  1151, # Gnome Leprechaun
  1164, # Ice Dragon
  1168, # Cyclops
  1210, # Sasquatch Yeti
  1229, # Fire Pegasus
  1237, # Cherub
  1268, # Ogre
  1329, # Chimera
  1378, # Mermaid
  1485, # Siren
  1535, # Retired Unicorn
  1536, # Retired Leprechaun
  1537, # Retired Dragon
  1538, # Retired Yeti
  1539, # Retired Faun
  1540, # Retired Hydra
  1542, # Retired Pegasus
  1543, # Retired Cyclops
  1544, # Fairy
  1602, # Dryad Fairy
  1603, # Wildfire Fairy
  1604, # Battle Unicorn
  1605, # Hippocamp Unicorn
  1630, # Fairy Godmother
  1646, # Dwarf Leprechaun
  1647, # Goblin Leprechaun
  1648, # Hot Spring Mermaid
  1649, # Melusine Mermaid
  1827, # Banshee
  1874, # Chinese Dragon
  1875, # Wyvern Dragon
  1876, # Lycanthrope Yeti
  1877, # Reptoid Yeti
  1929, # Gorgon
  1995, # Griffin Pegasus
  1996, # Alicorn Pegasus
  1997, # Centaur Faun
  1998, # Krampus Faun
  2051, # Retired Fairy
  2052, # Retired Banshee
  2118, # Nymph
  2252, # Cerberus Hydra
  2253, # Cthulhu Hydra
  2254, # Harpy Banshee
  2255, # Witch Banshee
  2337, # Mother Earth
  2477, # Minotaur Cyclops
  2478, # Balor Cyclops
  2479, # Vampire Nymph
  2480, # Elf Nymph
].freeze

POUCH_CREATURES = [
  1240, # Tuli
  1241, # Tulimber
  1242, # Tuliferno
  1370, # Vesi
  1371, # Vesial
  1372, # Vesisaur
  1638, # Muru
  1639, # Muruchi
  1640, # Murutain
  1745, # Hadavale
  1752, # Mitmegu
  1753, # Jootmegu
  1754, # Rohitmegu
  1755, # Lokemegu
  1850, # Gleaming Muru
  1851, # Gleaming Muruchi
  1853, # Gleaming Tuli
  1854, # Gleaming Tulimber
  1856, # Gleaming Vesi
  1857, # Gleaming Vesial
  1858, # Gleaming Vesisaur
  1919, # Pimedus
  2053, # Zombie Tuli
  2054, # Zombie Vesi
  2055, # Zombie Muru
  2240, # Puffle
  2241, # Pufrain
  2242, # Puflawn
  2306, # Magnetus
  2366, # Topaas
  2367, # Ametust
  2368, # Oniks
  2369, # Teemant
].freeze

# rubocop:enable Style/TrailingCommaInArrayLiteral

__END__
