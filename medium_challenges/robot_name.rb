# Write a program that manages robot factory settings.

# When robots come off the factory floor, they have no name. The first time you
# boot them up, a random name is generated, such as RX837 or BC811.

# Every once in a while, we need to reset a robot to its factory settings,
# which means that their name gets wiped. The next time you ask,
# it will respond with a new random name.

# The names must be random; they should not follow a predictable sequence.
# Random names means there is a risk of collisions. Your solution should not
# allow the use of the same name twice.

class Robot
  attr_accessor :name

  VALID_LETTERS = ('A'..'Z').to_a
  @@chosen_names = []

  def initialize
    @name = generate_name
  end

  def reset
    @@chosen_names.delete(name)
    self.name = generate_name
  end

  private

  def generate_name
    random_name = ''

    loop do
      2.times { random_name << VALID_LETTERS.sample }
      3.times { random_name << rand(0..9).to_s }

      break unless @@chosen_names.include?(random_name)
    end

    @@chosen_names << random_name
    random_name
  end
end
