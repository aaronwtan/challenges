# Implement octal to decimal conversion. Given an octal input string,
# your program should produce a decimal output. Treat invalid input as octal 0.
# The only valid digits in an octal number are 0, 1, 2, 3, 4, 5, 6, and 7.
require 'pry'
class Octal
  def initialize(octal_num_str)
    @octal_num_str = octal_num_str
  end

  def to_decimal
    return 0 if @octal_num_str =~ /\D|8|9/

    reversed_octal_num_str = @octal_num_str.reverse
    (0..@octal_num_str.length - 1).reduce(0) do |dec_num, exponent|
      dec_num + (reversed_octal_num_str[exponent].to_i * (8**exponent))
    end
  end
end
