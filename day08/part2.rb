#!/usr/bin/env ruby
# https://adventofcode.com/2022/day/8

input = File.read('day08/input').lines.map(&:strip)
transposed = input.map(&:chars).transpose.map(&:join)

visible_trees = []

def line_of_sight(line, position)
  trees = line.chars.map(&:to_i)
  candidate = trees[position]
  potentially_visible = trees[((position+1)..-1)]
  visibles = potentially_visible.take_while { |i| i < candidate }
  visibles == potentially_visible ? visibles.count : visibles.count + 1
end

def reverse_line_of_sight(line, position)
  line_of_sight(line.reverse, line.size - position - 1)
end

max = 0

input.each_with_index do |line, y|
  next if y.zero? || (y+1) == line.size

  line.chars.each_with_index do |tree, x|
    next if x.zero? || (x+1) == line.size

    result = line_of_sight(line, x) *
      reverse_line_of_sight(line, x) *
      line_of_sight(transposed[x], y) *
      reverse_line_of_sight(transposed[x], y)

    max = [result, max].max
  end
end

puts max.inspect
