#!/usr/bin/env ruby
# https://adventofcode.com/2022/day/5

# input = File.read('day05/input').lines.map(&:strip)
start, moves = File.read('day05/input').split("\n\n")

start = start.lines
stacks = []

start.pop.scan(/\d/).map(&:to_i).each_with_index do |n, i|
  offset = i+1+(i*3)
  stacks << start.reverse.map { |l| l[offset].strip }.reject(&:empty?)
end

moves.lines.each do |move|
  count, from, to = move.scan(/\d+/).map(&:to_i)
  from -= 1
  to -= 1
  stacks[to] ||= []
  stacks[to].push *stacks[from].pop(count)
end

puts stacks.map { |s| s[-1] }.join
