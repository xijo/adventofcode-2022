#!/usr/bin/env ruby
# https://adventofcode.com/2022/day/8

# input = File.read('day08/input').lines.map(&:strip)
input = File.read('day08/input').lines.map(&:strip)

visible_trees = []

def visible_positions(line)
  trees = line.chars.map(&:to_i)
  positions = [0]

  trees.each_with_index do |tree, pos|
    next if pos.zero?
    if trees[0..(pos-1)].all? { |before| before < tree }
      positions << pos
    end
  end
  positions
end

def reverse_visible_positions(line)
  visible_positions(line.reverse).map { |pos| line.size - pos - 1 }.reverse
end

input.each_with_index do |line, y|
  line.chars.each_with_index do |tree, x|
    x_positions = visible_positions(line) + reverse_visible_positions(line)
    x_positions.uniq.each do |x_pos|
      visible_trees << [x_pos, y]
    end
  end
end

input.map(&:chars).transpose.map(&:join).each_with_index do |line, x|
  line.chars.each_with_index do |tree, y|
    y_positions = visible_positions(line) + reverse_visible_positions(line)
    y_positions.uniq.each do |y_pos|
      visible_trees << [x, y_pos]
    end
  end
end

puts visible_trees.uniq.size
