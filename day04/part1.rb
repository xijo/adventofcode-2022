#!/usr/bin/env ruby
# https://adventofcode.com/2022/day/4

# input = File.read('day04/input').lines.map(&:strip)
input = File.read('day04/example').lines.map { |l| l.strip.split(?,).map { |p| eval(p.gsub(?-, '..')) } }

class Range
  def ⊆?(r)
    r.cover?(min) && r.cover?(max)
  end

  def &(r)
    to_a & r.to_a
  end
end

# part 1
puts input.select { |a, b| a.⊆?(b) || b.⊆?(a) }.size

# part 2
puts input.map { |a, b| a & b }.reject(&:empty?).size.inspect
