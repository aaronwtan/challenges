# Write some code that converts modern decimal numbers
# into their Roman number equivalents.

=begin
P
input: decimal number
output: string representing Roman number equivalent
  - no need to convert larger than 3000
  - letter set to use depend on digit place
    - 1000s -> M
    - 100s -> C, D
    - 10s -> X, L
    - 1s -> I, V
  - each digit group follows the same pattern for 1-9
    - 1 -> 1 x 1st group letter
    - 2 -> 2 x 1st group letter
    - 3 -> 3 x 1st group letter
    - 4 -> 1st group letter followed by 2nd group letter
    - 5 -> 2nd group letter
    - 6 -> 2nd group letter followed by 1 x 1st group letter
    - 7 -> 2nd group letter followed by 2 x 1st group letter
    - 8 -> 2nd group letter followed by 3 x 1st group letter
    - 9 -> 1st group letter followed by 1st group letter of next larger group
E
  1990
  1000s
  - 1990.divmod(1000)
    div = 1 -> M
    mod = 990
  100s
  - 990.divmod(100)
    div = 9 -> CM
    mod = 90
  10s
  - 90.divmod(10)
    div = 9 -> XC
    mod = 0 <- terminate when mod is 0
D

A

C
=end

# class RomanNumeral
#   def initialize(num)
#     @num = num
#   end

#   def to_roman
#     roman = ''

#     thousands, remainder = @num.divmod(1000)
#     roman << convert_thousands(thousands)

#     hundreds, remainder = remainder.divmod(100)
#     roman << convert_hundreds(hundreds)

#     tens, remainder = remainder.divmod(10)
#     roman << convert_tens(tens)

#     roman << convert_ones(remainder)
#   end

#   private

#   def convert_thousands(digit)
#     'M' * digit
#   end

#   def convert_hundreds(digit)
#     case digit
#     when 0..3 then 'C' * digit
#     when 4    then 'CD'
#     when 5    then 'D'
#     when 6..8 then 'D' + ('C' * (digit - 5))
#     when 9    then 'CM'
#     end
#   end

#   def convert_tens(digit)
#     case digit
#     when 0..3 then 'X' * digit
#     when 4    then 'XL'
#     when 5    then 'L'
#     when 6..8 then 'L' + ('X' * (digit - 5))
#     when 9    then 'XC'
#     end
#   end

#   def convert_ones(digit)
#     case digit
#     when 0..3 then 'I' * digit
#     when 4    then 'IV'
#     when 5    then 'V'
#     when 6..8 then 'V' + ('I' * (digit - 5))
#     when 9    then 'IX'
#     end
#   end
# end

# refactored
class RomanNumeral
  ROMAN_NUMERALS = %w(I V X L C D M)

  def initialize(num)
    @num = num
  end

  def to_roman
    roman = ''
    digits = @num.digits
    ind = 0

    digits.each do |digit|
      roman.prepend(decimal_to_roman(digit, ind))
      ind += 2
    end

    roman
  end

  def decimal_to_roman(digit, ind)
    case digit
    when 0..3 then ROMAN_NUMERALS[ind] * digit
    when 4    then ROMAN_NUMERALS[ind] + ROMAN_NUMERALS[ind + 1]
    when 5    then ROMAN_NUMERALS[ind + 1]
    when 6..8 then ROMAN_NUMERALS[ind + 1] + (ROMAN_NUMERALS[ind] * (digit - 5))
    when 9    then ROMAN_NUMERALS[ind] + ROMAN_NUMERALS[ind + 2]
    end
  end
end

# without depending on hash order

# class RomanNumeral
#   ROMAN_NUMERALS = {
#   "I" => 1,
#   "IV" => 4,
#   "V" => 5,
#   "IX" => 9,
#   "X" => 10,
#   "XL" => 40,
#   "L" => 50,
#   "XC" => 90,
#   "C" => 100,
#   "CD" => 400,
#   "D" => 500,
#   "CM" => 900,
#   "M" => 1000,
# }

#   def initialize(num)
#     @num = num
#   end

#   def to_roman
#     roman = ''
#     to_convert = @num

#     ROMAN_NUMERALS.values.sort.reverse.each do |value|
#       while to_convert >= value
#         roman << ROMAN_NUMERALS.key(value)
#         to_convert -= value
#       end
#     end

#     roman
#   end
# end
