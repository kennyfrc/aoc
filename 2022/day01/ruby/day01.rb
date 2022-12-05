# frozen_string_literal: true

# create a function that takes a file
# first, initialize an array called "elf"
# second, initialize an integer called "max" with 0
# for each line in the file,
#   if the line is not empty,
#     then add the line into the array called "elf"
#   if the line is empty and if "elf" is not empty,
#     then sum the "elf" array and store in "temp_max" variable
#     then if "temp_max" is greater than "max",
#       then set "max" to "temp_max"
#     then reset the "elf" array
#     then skip to the next line
#   if the line does not exist and if "elf" is empty,
#     then skip to the next line
# print the "max" variable

# can be cleaner
module MaxCaloriesv1
  class << self
    def max_calories(file)
      elf = []
      global_max = 0
      File.foreach(file) do |line|
        if line != "\n"
          elf << line.to_i
        elsif line == "\n" && !elf.empty?
          elf_max = elf.sum
          global_max = elf_max if elf_max > global_max
          elf = []
          next
        elsif line == "\n" && elf.empty?
          next
        end
      end
      global_max
    end

    # ugly. needs refactoring.
    def total_calories_of_top3(file)
      elf = []
      top3elves = []
      max_lines = File.foreach(file).count
      lines = 0
      File.foreach(file) do |line|
        lines += 1
        if line != "\n" && lines != max_lines
          elf << line.to_i
        elsif line == "\n" || lines == max_lines
          elf << line.to_i if elf.empty?
          elf_max = elf.sum
          if top3elves.size < 3
            top3elves << elf_max
          elsif elf_max > top3elves.min
            top3elves.delete(top3elves.min)
            top3elves << elf_max
          end
          elf = []
          next
        else
          raise "something went wrong on line #{lines}, with input #{line}"
        end
      end
      top3elves.sum
    end
  end
end

if ARGV.empty?
  puts 'Usage: ruby day01.rb <file>'
else
  puts "Max calories: #{MaxCaloriesv1.max_calories(ARGV[0])}"
  puts "Total calories of top 3: #{MaxCaloriesv1.total_calories_of_top3(ARGV[0])}"
end
