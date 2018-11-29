require './lib/card'
require './lib/turn'
require 'pry'

class Round
  attr_accessor :turns, :number_correct, :incorrect_guesses, :guesses
  card_index = 0

  def initialize(deck)
    card_index = 0
    @current_card = deck.cards[card_index]
    turn_count = 0
    correct_turns = []
    incorrect_turns = []
    turns = (correct_turns << incorrect_turns).flatten
    guesses = []

  end

  def take_turn(guess)
    @turn = Turn.new(guess, @current_card)
    turns << @turn
    turn_count += 1
    #turns is array that stores each turn
    #every time a turn is taken, increment card_index,
    #store guess, store turn
  end

  def store_turn_results
    if @turn.correct?
      correct_turns << @turn
    else
      incorrect_turns << @turn
    end
  end

  def

# round.number_correct_by_category(:Geography)
# round.percent_correct
# round.percent_correct_by_category(:Geography)
