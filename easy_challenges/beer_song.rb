class BeerSong
  def self.verse(num)
    case num
    when 0
      "No more bottles of beer on the wall, #{bottles(num)} of beer.\n" \
      "Go to the store and buy some more, #{bottles(99)} of beer on the wall.\n"
    when 1
      "#{bottles(num)} of beer on the wall, #{bottles(num)} of beer.\n" \
      "Take it down and pass it around, #{bottles(num - 1)} of beer on the wall.\n"
    when 2..99
      "#{bottles(num)} of beer on the wall, #{bottles(num)} of beer.\n" \
      "Take one down and pass it around, #{bottles(num - 1)} of beer on the wall.\n"
    end
  end

  def self.verses(first, last)
    first.downto(last).map(&method(:verse)).join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def bottles(num)
      case num
      when 0     then "no more bottles"
      when 1     then "#{num} bottle"
      when 2..99 then "#{num} bottles"
      end
    end
  end
end
