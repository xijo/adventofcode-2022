#!/usr/bin/env ruby
# https://adventofcode.com/2022/day/6

input = File.read('day06/example').strip.chars

# part 1
_c, i = input.each_with_index.find { |_c, index| input[([index-3, 0].max)..(index)].uniq.size == 4 }
puts i + 1

# part 2
_c, i = input.each_with_index.find { |_c, index| input[([index-13, 0].max)..(index)].uniq.size == 14 }
puts i + 1
