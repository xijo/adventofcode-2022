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

def choice(opponent, outcome)
  case outcome
  when ?X
    { ?A => ?Z, ?B => ?X, ?C => ?Y }[opponent]
  when ?Y
    { ?A => ?X, ?B => ?Y, ?C => ?Z }[opponent]
  when ?Z
    { ?A => ?Y, ?B => ?Z, ?C => ?X }[opponent]
  end
end

puts input.map { |line|
  opp = line.first
  me = choice(*line)
  score(me) + bonus(opp, me)
}.sum.inspect


# A X rock
# B Y paper
# C Z scissors
