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
    @deck.cards[card_index]
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

  def categories
    categories = @deck.cards.map do |card|
      card.category
    end
    categories.uniq
  end

  def number_by_category_query(category, turns_array)
    group = turns_array.select do |turn|
      turn.card.category == category
    end
    group.count
  end

  def number_correct_by_category(category)
    number_by_category_query(category, correct_turns)
  end
  #Needs to stay separate from number_in_categorym method

  def number_in_category(category)
    number_by_category_query(category, turns)
  end
  #Needs to stay separate from number_correct_by_category because this one is used for percent_correct_by_category calc

  def get_percent(numerator, denominator)
    return 0.0 if denominator == 0
    fraction = (numerator.to_f/denominator.to_f)*100
    fraction.to_f.round(2)
  end

  def percent_correct
    get_percent(correct_turns.count, turns.count)
  end

  def percent_correct_by_category(category)
    get_percent(number_correct_by_category(category), number_in_category(category))
  end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards."
    puts "------------------------------"
    @deck.cards.each do |card|
      next_question
    end
    end_game
  end

  def next_question
    puts "This is card number #{@turns.count + 1} out of #{@deck.count}."
    puts "Question: #{current_card.question}"
    take_turn(gets.chomp)
    @turns.last.feedback
  end

  def end_game
    puts "****** Game over! ******
You had #{correct_turns.count} correct guesses out of #{@deck.count} for a total score of #{percent_correct}%."
    print_category_results
  end

  def print_category_results
    categories.each do |category|
      puts "#{category} - #{percent_correct_by_category(category)}%"
    end
  end

end

# card1 = Card.new("question1", "answer1", "category1")
# card2 = Card.new("question2", "answer2", "category2")
# card3 = Card.new("question3", "answer3", "category1")
# deck1 = Deck.new([card1, card2, card3])
# round1 = Round.new(deck1)
# round1.take_turn("answer1")
# round1.take_turn("answer1")
# round1.take_turn("answer1")
#
# binding.pry
