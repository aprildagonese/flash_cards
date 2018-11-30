require './lib/card'
require './lib/turn'
require './lib/deck'
require 'pry'

class Round
  attr_accessor :turns, :deck

  def initialize(deck)
    @turns = []
    @deck = deck
  end

  def card_index
    @turns.count
  end

  def current_card
    deck.cards[card_index]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
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
      turn.card.category == category
    end
    correct_by_cat.count
  end

  #could pull out method that takes category and array for these two

  def number_in_category(category)
    number_in_category = turns.select do |turn|
      turn.card.category == category
    end
    number_in_category.count
  end

  def get_percent(numerator, denominator)
    return 0.0 if denominator == 0
    fraction = (numerator/denominator)*100
    fraction.to_f
  end

  def percent_correct
    get_percent(correct_turns.count, @turns.count)
  end

  def percent_correct_by_category(category)
    get_percent(number_correct_by_category(category), number_in_category(category))
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards."

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
