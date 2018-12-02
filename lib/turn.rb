require './lib/card'
require 'pry'

class Turn
attr_accessor :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess.downcase.strip == card.answer.downcase.strip
  end

  def feedback
    if correct?
      p "Correct!"
    else
      p "Incorrect."
    end
  end

end
