require 'pry'
class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    results = []
    candidates.each { |value| results << value if ord_total?(value) && anagram?(value) && value.downcase != @word }
    results
    end

  def ord_total?( value)
    value.chars.map(&:ord).reduce(:+) == @word.chars.map(&:ord).reduce(:+)
  end

  def anagram?(other_word)
    # binding.pry
    @word.scan(/[#{other_word}]/i) == @word.chars
  end

end

test = Anagram.new('galea')
p test.match(['eagle'])
