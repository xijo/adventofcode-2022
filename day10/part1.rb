#!/usr/bin/env ruby
# https://adventofcode.com/2022/day/10

input = File.read('day10/input').lines.map(&:strip)

cycle = 0
x = 1

@strength = []

def log_cycle(cycle, x)
  if [20, 60, 100, 140, 180, 220].include?(cycle)
    @strength << (cycle * x)
  end
end

operations = input.each do |line|
  case line
  when 'noop'
    cycle += 1
    log_cycle(cycle, x)
  when /addx/
    cycle += 1
    log_cycle(cycle, x)

    count = line.split(' ').last.to_i
    cycle += 1
    log_cycle(cycle, x)
    x += count
  end
end

puts @strength.inspect
puts @strength.sum
