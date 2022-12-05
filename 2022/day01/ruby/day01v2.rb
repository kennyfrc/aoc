# frozen_string_literal: true

module MaxCaloriesv2
  class Elf
    attr_reader :food

    def initialize
      @food = []
    end

    def add(dish)
      food << dish
    end

    def sum
      food.sum
    end

    def merge(blk)
      _blk = Elf.new
      _blk.add(sum + blk.sum)
      _blk
    end
  end

  def self.sort_elves(elves, current_elf)
    elves = elves.clone
    if current_elf.sum > elves[0].sum
      elves[2] = elves[1]
      elves[1] = elves[0]
      elves[0] = current_elf
    elsif current_elf.sum > elves[1].sum
      elves[2] = elves[1]
      elves[1] = current_elf
    elsif current_elf.sum > elves[2].sum
      elves[2] = current_elf
    end
    elves
  end

  def self.organize_elves(file:, elves:, current_elf:)
    current_elf = current_elf.clone
    elves = elves.clone
    File.foreach(file) do |line|
      if line != "\n"
        line.to_i
        current_elf.add(line.to_i)
      elsif line == "\n"
        case elves.size
        when 0..2
          elves << current_elf
        end
        elves = sort_elves(elves, current_elf) if elves.size == 3
        current_elf = Elf.new
      else
        raise StandardError, 'Invalid Format. Each integer must be separated with newlines.'
      end
    end
    [elves, current_elf]
  end

  def self.max_calories(file, flag)
    elves, current_elf = organize_elves(file: file, elves: [], current_elf: Elf.new)
    elves = sort_elves(elves, current_elf) # integer in the last line of the file
    return elves.map.reduce(:merge).sum if flag == 3
    return elves[0].sum if flag == 1
  end
end

if ARGV.empty?
  puts 'Usage: ruby day01.rb <file> <flag={1,3}>'
else
  file = ARGV[0]
  flag = (ARGV[1] || 1).to_i # default to 1
  p MaxCaloriesv2::max_calories(file, flag)
end
