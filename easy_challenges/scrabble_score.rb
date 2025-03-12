# Write a program that, given a word, computes the Scrabble score
# for that word.

class Scrabble
  LETTER_SCORES = {
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
  }

  def self.score(word)
    Scrabble.new(word).score
  end

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil?

    score = 0
    upcased_word = @word.upcase

    LETTER_SCORES.each do |letters, value|
      score += value * upcased_word.count(letters)
    end

    score
  end
end
