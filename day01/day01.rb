puts File.read('day01/input').split("\n\n").map { |g| g.split.map(&:to_i).sum }.max.inspect
puts File.read('day01/input').split("\n\n").map { |g| g.split.map(&:to_i).sum }.max(3).sum.inspect
