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

def get_max_calories(file)
  elf = []
  max = 0
  File.foreach(file) do |line|
    if line != "\n"
      elf << line.to_i
    elsif line == "\n" && elf != []
      temp_max = elf.sum
      max = temp_max if temp_max > max
      elf = []
      next
    elsif line == "\n" && elf == []
      next
    end
  end
  max
end

if ARGV.empty?
  puts "Usage: ruby day01.rb <file>"
else
  puts get_max_calories(ARGV[0])
end
