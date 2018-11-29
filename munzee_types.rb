require 'oga'
require 'rkelly'

def parse_js_data script
  js = RKelly::Parser.new.parse(script)
  js.each { |node|
    if node.is_a?(RKelly::Nodes::PropertyNode) && node.name == 'data'
      return node.value.value.map { |item|
        pair = item.value.value
        pair.map { |e| e.value.value }
      }.to_h
    end
  }
end

def parse_html io
  doc = Oga.parse_html(io)
  script = doc.at_css('body > script')
  parse_js_data(script.text)
end

data = File.open('munzeetypes.html') { |io| parse_html(io) }
p data

__END__
