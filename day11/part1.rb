#!/usr/bin/env ruby
# https://adventofcode.com/2022/day/11

require 'byebug'

input = File.read('day11/input').chomp

monkeys = {}

input.split("\n\n").each_with_index do |block, i|
  result = {}
  result[:items] = block.lines[1].scan(/\d+/).map(&:to_i)
  result[:op] = block.lines[2].sub('Operation: new = ', '').strip
  result[:test] = block.lines[3].scan(/\d+/).first.to_i
  result[true] = block.lines[4].scan(/\d+/).first.to_i
  result[false] = block.lines[5].scan(/\d+/).first.to_i
  result[:inspects] = 0
  monkeys[i] = result
end

round = 0

while round < 20 do
  monkeys.keys.each do |turn|
    monkey = monkeys[turn]

    until monkey[:items].empty? do
      item = monkey[:items].shift
      monkey[:inspects] += 1
      item = eval(monkey[:op].dup.gsub('old', item.to_s))
      item = (item / 3).floor

      monkeys[monkey[item % monkey[:test] == 0]][:items] << item
    end
  end

  round += 1
end

# part 1
puts monkeys.map { |k, v| v[:inspects] }.max(2).inject(&:*)
