input = File.read('day02/input').lines.map { |l| l.strip.split(' ') }

def bonus(opponent, me)
  return 3 if [[?A, ?X], [?B, ?Y], [?C, ?Z]].include?([opponent, me])
  [[?A, ?Y], [?B, ?Z], [?C, ?X]].include?([opponent, me]) ? 6 : 0
end

def score(choice)
  case choice
  when ?A, ?X then 1
  when ?B, ?Y then 2
  when ?C, ?Z then 3
  end
end

puts input.map { |l| score(l[1]) + bonus(*l) }.sum.inspect
