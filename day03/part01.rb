input = File.read('day03/input').lines.map(&:strip)
# input = File.read('day03/example').lines.map(&:strip)

def split(line)
  line.chars.each_slice(line.size / 2).map(&:join)
end

prios = (?a..?z).zip(1..26).to_h.merge((?A..?Z).zip(27..52).to_h)

# part1
result = input.map do |line|
  prios[split(line).map(&:chars).inject(&:&)[0]]
end.sum

puts result.inspect

#part2
result = input.each_slice(3).to_a.map do |group|
  prios[group.map(&:chars).inject(&:&)[0]]
end.sum

puts result.inspect
