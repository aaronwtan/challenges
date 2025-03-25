# Write a program that will take a string of digits and return
# all the possible consecutive number series of a specified length
# in that string.

class Series
  def initialize(digits_str)
    @digits = digits_str.chars.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError if length > digits.size

    (0..digits.size - length).map do |start_ind|
      digits[start_ind, length]
    end
  end

  private

  attr_reader :digits
end
