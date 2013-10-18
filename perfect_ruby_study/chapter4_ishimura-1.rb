#!/usr/bin/env ruby

arr = [0, 1, 2, 3]

def arr.swap(i1, i2)
  return self if i1 < 0 || i2 < 0
  return self if self[i1].nil? || self[i2].nil?

  e1 = self[i1]
  e2 = self[i2]
  ret = self.clone
  ret[i1] = e2
  ret[i2] = e1
  return ret
end

def arr.swap!(i1, i2)
  return self if i1 < 0 || i2 < 0
  return self if self[i1].nil? || self[i2].nil?

  e1 = self[i1]
  e2 = self[i2]
  ret = self
  ret[i1] = e2
  ret[i2] = e1
  return ret
end


p arr.swap 1, 2
p arr

p arr.swap! 1, 2
p arr
