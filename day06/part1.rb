#!/usr/bin/env ruby
# https://adventofcode.com/2022/day/6

input = File.read('day06/input').strip.chars

# part 1
input.each_with_index do |char, index|
  if input[([index-3, 0].max)..(index)].uniq.size == 4
    puts index + 1
    break
  end
end

# part 2
input.each_with_index do |char, index|
  if input[([index-13, 0].max)..(index)].uniq.size == 14
    puts index + 1
    break
  end
end
