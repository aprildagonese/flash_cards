require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

class Round
  attr_accessor :turn, :turns, :deck, :incorrect_turns, :correct_turns
  card_index = 0

  def initialize(deck)
    @card_index = 0
    @current_card = deck.cards[@card_index]
    @correct_turns = []
    @incorrect_turns = []
    @turns = (@correct_turns + @incorrect_turns)
    @guesses = []
    @deck = deck
  end

  def take_turn(guess)
    @turn = Turn.new(guess, @current_card)
    @card_index += 1
    store_turn_results
  end

  def store_turn_results
    @turns << @turn
  end

  def correct_turns
    @turns.select do |turn|
      turn.correct?
    end
  end

  def incorrect_turns
    @turns.select do |turn|
      !turn.correct?
    end
  end

  def guesses
    @guesses = @turns.map do |turn|
      turn.guess
    end
  end

  def number_correct_by_category(category)
    correct_by_cat = correct_turns.select do |turn|
      turn.card.category.to_s == category.to_s
    end
    correct_by_cat.count
  end

  def 

end

card1 = Card.new("question1", "answer1", "category1")
card2 = Card.new("question2", "answer2", "category2")
card3 = Card.new("question3", "answer3", "category1")
deck1 = Deck.new([card1, card2, card3])
round1 = Round.new(deck1)
round1.deck
round1.take_turn("answer1")
round1.number_correct_by_category("category1")

binding.pry



# round.percent_correct
# round.percent_correct_by_category(:Geography)
