#!/usr/bin/env ruby

module Swappable
  def swap(i1, i2)
    return self if i1 < 0 || i2 < 0
    return self if self[i1].nil? || self[i2].nil?

    self.clone.swap! i1, i2
  end

  def swap!(i1, i2)
    return self if i1 < 0 || i2 < 0
    return self if self[i1].nil? || self[i2].nil?
    
    self[i1], self[i2] = self[i2], self[i1]
    return self
  end
end

arr = [0, 1, 2, 3]
arr.extend Swappable

p arr.swap 1, 2
p arr

p arr.swap! 1, 2
p arr
