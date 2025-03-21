# Write a program that, given a natural number and a set of
# one or more other numbers, can find the sum of all the
# multiples of the numbers in the set that are less than the first number.
# If the set of numbers is not given, use a default set of 3 and 5.

class SumOfMultiples
  def self.to(num)
    new.to(num)
  end

  def initialize(*multiples)
    @multiples = multiples.empty? ? [3, 5] : multiples
  end

  def to(num)
    find_multiples_of(num).sum
  end

  def find_multiples_of(num)
    (1...num).select do |current_num|
      @multiples.any? { |multiple| current_num % multiple == 0 }
    end
  end
end
