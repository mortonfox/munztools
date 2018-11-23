# Report how many different mythicals player has captured on each day.

MYTH_TYPES = {
  505 => 'Unicorn',
  508 => 'Leprechaun',
  573 => 'Dragon',
  725 => 'Yeti',
  853 => 'Faun',
  953 => 'Hydra',
  1100 => 'Pegasus',
  1168 =>'Cyclops',
  1378 => 'Mermaid',
  1544 => 'Fairy'
}

require_relative 'munzee_api'

munz = MunzeeAPI.new

require 'pp'

# result = munz.post('/statzee/player/captures/types', username: 'mortonfox')
# pp result

result = munz.post('/statzee/player/day/', day: Date.civil(2018, 11, 23))
pp result

__END__
