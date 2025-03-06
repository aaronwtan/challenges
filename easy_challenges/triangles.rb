# Write a program to determine whether a triangle is equilateral, isosceles,
# or scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of length > 0,
# and the sum of the lengths of any two sides must be greater than the length
# of the third side.

class Triangle
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]

    raise ArgumentError unless valid?
  end

  def kind
    case sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    when 3 then 'scalene'
    end
  end

  private

  attr_reader :sides

  def valid?
    sides.all?(&:positive?) && sides.sum > sides.max * 2
  end
end
