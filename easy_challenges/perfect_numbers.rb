# Write a program that can tell whether a number is perfect, abundant,
# or deficient.

class PerfectNumber
  def self.classify(num)
    aliquot_sum = divisors(num).sum - num

    case aliquot_sum <=> num
    when 1  then 'abundant'
    when 0  then 'perfect'
    when -1 then 'deficient'
    end
  end

  class << self
    private

    def divisors(num)
      result = []

      Math.sqrt(num).to_i.downto(1) do |divisor|
        if (num % divisor).zero?
          result << (num / divisor)
          result.unshift(divisor)
        end
      end

      result.uniq
    end
  end
end
