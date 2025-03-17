# In this program, we'll construct objects that represent a meetup date.
# Each object takes a month number (1-12) and a year (e.g., 2021).
# Your object should be able to determine the exact date of the meeting
# in the specified month and year. For instance,
# if you ask for the 2nd Wednesday of May 2021, the object should be able
# to determine that the meetup for that month will occur
# on the 12th of May, 2021.

=begin
#day method
P
input: strings representing weekday and schedule
output: date object corresponding to the weekday and schedule
        of the calling Meetup object
        - return should be nil if the date does not exist

E
for June 2013
  first Wednesday
    June 5, 2013 <- first Wednesday found

for July 2014
  third Tuesday
    July 1,  2014 - first Tuesday
    July 8,  2014 - second Tuesday
    July 15, 2014 <- third Tuesday found

for August 2015
  fifth Monday
    August 3,  2015 - first Monday
    August 10, 2015 - second Monday
    August 17, 2015 - third Monday
    August 24, 2015 - fourth Monday
    August 31, 2015 <- fifth Monday found

for October 2015
  fifth Wednesday
    October 7,  2015 - first Wednesday
    October 14, 2015 - second Wednesday
    October 21, 2015 - third Wednesday
    October 28, 2015 - fourth Wednesday
    past end of month <- fifth Wednesday not found; return nil
D
- need to work with Date objects
- need to step through month of date object and count each time the
  weekday input is found
- need to return date when count corresponds to schedule
- need to return nil if entire month was stepped through without finding match

A


C
=end
require 'date'

class Meetup
  DESCRIPTORS = %w(first second third fourth fifth)

  def initialize(year, month)
    @start_date = Date.new(year, month)
  end

  def day(weekday, schedule)
    found_dates = find_dates(weekday)

    case schedule.downcase
    when 'last' then found_dates.last
    when 'teenth'
      found_dates.each { |date| return date if date.day.between?(13, 19) }
    else found_dates[DESCRIPTORS.index(schedule.downcase)]
    end
  end

  private

  def find_dates(weekday)
    (@start_date...@start_date.next_month).select(&:"#{weekday.downcase}?")
  end
end
