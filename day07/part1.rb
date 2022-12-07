#!/usr/bin/env ruby
# https://adventofcode.com/2022/day/7

require 'byebug'

# input = File.read('day07/input').lines.map(&:strip)
input = File.read('day07/input')

class Filesystem
  attr_accessor :fs, :cp

  def initialize
    @fs = { '/' => {} }
    @cp = ['/'] # current position
  end

  def write(file, size)
    fs.dig(*cp)[file] = size
  end

  def mkdir(name)
    fs.dig(*cp)[name] = {}
  end

  def cd(target)
    case target
    when '/'  then @cp = ['/']
    when '..' then @cp.pop
    else @cp.push target
    end
  end

  def size(path = cp)
    content = fs.dig(*path)
    return content if content.is_a?(Integer)

    content.map do |key, value|
      if value.is_a?(Integer)
        value
      else
        size(path.dup.push(key))
      end
    end.sum
  end

  def ls_dirs(path = cp)
    content = fs.dig(*path)

    result = [path.dup]
    content.map do |key, value|
      if value.is_a?(Hash)
        result += ls_dirs(path.dup.push(key))
      end
    end
    result
  end
end

fs = Filesystem.new

input.split('$ ').each do |part|
  part.lines.each do |line|
    case line
    when /\Acd (.*)/
      fs.cd($1)
    when /\Als/
      # no-op
    when /\Adir (.*)/
      fs.mkdir($1)
    else # is a file
      size, file = line.split(' ')
      fs.write(file, size.to_i)
    end
  end
end

# part 1
fs.cd '/'
puts fs.ls_dirs.map { |d| fs.size(d) }.reject { |s| s > 100000 }.sum

# part 2
total_space = 70000000
unused_space = total_space - fs.size
update_size = 30000000
need_to_free_size = update_size - unused_space

puts "need to free at least: #{need_to_free_size}"
puts "best option: " + fs.ls_dirs.map { |d| [d, fs.size(d)] }.reject { |d,s| s < need_to_free_size }.sort_by(&:last).first.inspect
