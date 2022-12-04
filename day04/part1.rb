#!/usr/bin/env ruby
# https://adventofcode.com/2022/day/4

input = File.read('day04/input').lines.map { |l| l.strip.split(?,).map { |p| eval(p.gsub(?-, '..')) } }

class Range
  def &(r)
    to_a & r.to_a
  end
end

# part 1
puts input.select { |a, b| a.cover?(b) || b.cover?(a) }.size

# part 2
puts input.map { |a, b| a & b }.reject(&:empty?).size.inspect
