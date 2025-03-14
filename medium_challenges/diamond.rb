# The diamond exercise takes as its input a letter, and outputs it
# in a diamond shape. Given a letter, it prints a diamond starting with 'A',
# with the supplied letter at the widest point.

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.

=begin
P
input: capital letter string
output: string representing diamond starting at 'A' with input letter at widest point

E
[A, B, C, D, E]
 0  1  2  3  4  distance from center
    A       0 ^ 4
   B B      1 ^ 3
  C   C     2 ^ 2
 D     D    3 ^ 1
E       E   4 center
 D     D    3 v 1
  C   C     2 v 2
   B B      1 v 3
    A       0 v 4

D
- output should be string with each diamond line separated by new lines
- since string is symmetrical, can start at center line and with each iteration
  prepend and append the corresponding lines which will be identical
- should start at center line and iterate for (input letter position - 1) iterations
- width of each line is (input letter position) * 2 + 1

A
1. generate letters array from 'A' to input letter
2. init diamond_width as size of letters array * 2 - 1
3. return "A\n" if diamond_width is 1
4. init inner_spaces count as diamond_width - 2
5. init result array with str beginning and ending with input letter with
   inner_spaces number of spaces between
6. reverse letters array and iterate from input letter preceding input to 'B'
  - decrement inner_spaces by 2
  - init current_line beginning and ending with current letter with inner_spaces
   number of spaces between
  - call center on current_line to pad with spaces up to diamond_width
  - append \n to current_line
  - prepend and append current_line to result array
7. after iteration, prepend and append line with single 'A'
   at the center followed
8. return result array joined with \n and appended with final \n

C
=end

class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(letter)
    letters = ('A'..letter).to_a
    width = (letters.size * 2) - 1

    result = letters.map { |current_letter| create_line(current_letter, width) }
    result += result[0...-1].reverse

    result.join("\n") + "\n"
  end

  class << self
    private

    def create_line(letter, width)
      return letter.center(width) if letter == 'A'

      "#{letter}#{' ' * inner_spaces(letter)}#{letter}".center(width)
    end

    def inner_spaces(letter)
      (ALPHABET.index(letter) * 2) - 1
    end
  end
end
