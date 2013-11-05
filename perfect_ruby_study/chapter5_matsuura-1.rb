#!/usr/bin/env ruby
# encoding:utf-8

class Fixnum
  def fizz?
    self % 3 == 0
  end

  def buzz?
    self % 5 == 0
  end
end

class Array
  def select_fizz
    self.select {|v| v.is_a?(Fixnum) && v.fizz? }
  end

  def has_fizz?
    self.any? {|v| v.is_a?(Fixnum) && v.fizz? }
  end
end

p [1, 2, 3, 4, 5, 6].select_fizz
p [1, 2].has_fizz?
p [1, 2, 3].has_fizz?

p [1, 2, 'three'].select_fizz
p [1, 2, 'three', 6].select_fizz
p [1, 2, 'three'].has_fizz?
p [1, 2, 'three', 6].has_fizz?
