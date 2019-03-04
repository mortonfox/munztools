# frozen_string_literal: true

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
  681 # Virtual Sapphire
].freeze

DESTINATIONS = [
  70, # Motel
  170, # Hotel
  470, # Virtual Resort
  970 # Time Share
].freeze

ROOMS = [
  71, # Motel Room
  171, # Hotel Room
  471, # Virtual Resort Room
  971 # Time Share Room
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
  1770 # Cinema
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
  1421, # Virtual Blue
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
  1473 # Virtual Brown
].freeze

FLATS = [
  353, # Flat Rob
  1015, # Flat Matt
  1581, # Flat Hammock
  1338 # Flat Lou
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
  1790, # Lily Seed
  1798 # Carnation Seed
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
  1086, # Air Mystery
  532, # Fire Mystery
  651, # Ice Mystery
  851, # Earth Mystery
  1020 # Water Mystery
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
  1277, # Dragon Chinese Zodiac
  1273, # Rat Chinese Zodiac
  1274, # Ox Chinese Zodiac
  1275, # Tiger Chinese Zodiac
  1276, # Rabbit Chinese Zodiac
  1278 # Snake Chinese Zodiac
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
  1649 # Melusine Mermaid
].freeze

POUCH_CREATURES = [
  1240, # Tuli
  1370, # Vesi
  1638, # Muru
  1752, # Mitmegu
  1753, # Jootmegu
  1754, # Rohitmegu
  1755 # Lokemegu
].freeze

__END__
