#!/usr/bin/env ruby

def exec_and_puts_elapses(&block)
  puts "-- begin exec_and_puts_elapses --"
  before_exec = Time.now

  begin
    block.call if block
  rescue => e
    puts "Error occurred. #{e.class}, #{e.message}"
  ensure
    puts Time.now - before_exec
  end

  puts "-- end exec_and_puts_elapses --"
end


exec_and_puts_elapses do 
  1 / 1
  sleep 1
end

exec_and_puts_elapses do 
  loop do
    sleep 1
    break if rand(3) == 1
  end
end

