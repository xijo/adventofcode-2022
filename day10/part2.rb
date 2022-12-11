#!/usr/bin/env ruby
# https://adventofcode.com/2022/day/10

input = File.read('day10/input').lines.map(&:strip)

cycle = 0
sprite = 1

@output = []

def draw(cycle, sprite)
  line = (cycle / 40).floor
  # puts line.inspect
  @output[line] ||= []
  position = cycle % 40

  @output[line][position] = [sprite - 1, sprite, sprite + 1].include?(position) ? ?# : ?.
end

operations = input.each do |line|
  case line
  when 'noop'
    draw(cycle, sprite)
    cycle += 1
  when /addx/
    draw(cycle, sprite)
    cycle += 1

    count = line.split(' ').last.to_i
    draw(cycle, sprite)
    cycle += 1
    sprite += count
  end
end

puts @output.map(&:join).join(?\n)
