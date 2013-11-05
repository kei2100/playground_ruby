#!/usr/bin/env ruby

class Counter
  attr_accessor :count

  def initialize
    @count = 0
  end

  def increment
    tmp = @count
    @count = tmp + 1
  end
end

counter = Counter.new
mutex = Mutex.new

#100.times.map {
#  Thread.fork {
#    counter.increment
##    mutex.synchronize { counter.increment } 
#  }
#}.map(&:join)

ts = []
100.times do 
  ts << Thread.fork do
    Thread.stop
    counter.increment
  end
end

sleep 1

ts.each &:wakeup
ts.each &:join

p counter.count


