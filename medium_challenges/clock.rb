# Create a clock that is independent of date.

# You should be able to add minutes to and subtract minutes from the time
# represented by a given Clock object. Note that you should not mutate
# Clock objects when adding and subtracting minutes --
# create a new Clock object.

# Two clock objects that represent the same time should be equal to each other.

# You may not use any built-in date or time functionality;
# just use arithmetic operations.

class Clock
  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

  def self.at(hour, minute = 0)
    new((hour * MINUTES_PER_HOUR) + minute)
  end

  def initialize(total_minutes)
    @total_minutes = total_minutes
  end

  def +(minutes_added)
    new_total_minutes = total_minutes + minutes_added
    new_total_minutes -= MINUTES_PER_DAY while new_total_minutes >= MINUTES_PER_DAY
    Clock.new(new_total_minutes)
  end

  def -(minutes_subtracted)
    new_total_minutes = total_minutes - minutes_subtracted
    new_total_minutes += MINUTES_PER_DAY while new_total_minutes.negative?
    Clock.new(new_total_minutes)
  end

  def ==(other_clock)
    @total_minutes == other_clock.total_minutes
  end

  def to_s
    hour, minute = total_minutes.divmod(60)
    format("%02d:%02d", hour, minute)
  end

  protected

  attr_reader :total_minutes
end
