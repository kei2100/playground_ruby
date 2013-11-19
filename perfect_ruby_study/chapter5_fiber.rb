#!/usr/bin/env ruby

require "io/console"

filepath = ARGV[0]

if filepath.nil? || ! File.exists?(filepath)
  puts "Usage: #{File.basename(__FILE__)} <filepath>"
  exit 1
end

fiber = Fiber.new {
  File.open(filepath) do |f|
    system "clear"
    enum = f.each_line
    lazy =  enum.lazy.map {|line| line }
    lines_per_take = 20
    
    puts lines = lazy.take(lines_per_take).force
    taked_lines = lines.length

    loop do
      input = Fiber.yield(lines)

      case input
      when "f"
        puts lines = lazy.take(lines_per_take).force
        taked_lines += lines.length
      when "b"
        lines_will_take = taked_lines - lines_per_take
        if lines_will_take < lines_per_take
          lines_will_take = lines_per_take
        end
        
        system "clear"
        enum.rewind

        puts lines = lazy.take(lines_will_take).force
        taked_lines = lines.length
      when "j"
        puts lines = lazy.take(1).force
        taked_lines += lines.length
      when "k"
        lines_will_take = taked_lines - 1
        if lines_will_take < lines_per_take
          lines_will_take = lines_per_take
        end
        
        system "clear"
        enum.rewind

        puts lines = lazy.take(lines_will_take).force
        taked_lines = lines.length
      end
    end
  end
}

fiber.resume

while input = STDIN.noecho(&:gets).chop
  if /[fbjk]/ === input
    lines = fiber.resume(input)

    if lines.length == 0
      puts "-----[EOF]-----"
      exit 0
    end
  end
end


