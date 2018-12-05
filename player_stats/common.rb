# frozen_string_literal: true

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

__END__
