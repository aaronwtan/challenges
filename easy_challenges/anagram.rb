# Write a program that takes a word and a list of possible anagrams
# and selects the correct sublist that contains the anagrams of the word.

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(candidates)
    sorted_word = @word.chars.sort.join

    candidates.select do |candidate|
      sorted_candidate = candidate.downcase.chars.sort.join
      sorted_candidate == sorted_word && candidate.downcase != @word
    end
  end
end
