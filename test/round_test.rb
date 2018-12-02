require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card1 = Card.new("question1", "answer1", "category1")
    @card2 = Card.new("question2", "answer2", "category2")
    @card3 = Card.new("question3", "answer3", "category1")
    @deck1 = Deck.new([@card1, @card2, @card3])
    @round1 = Round.new(@deck1)
  end

  def test_initialize_method
    assert_equal @deck1, @round1.deck
  end

  def test_initial_current_card
    assert_equal @card1, @round1.current_card
  end

  def test_take_turn_with_turn_count
    @round1.take_turn("answer1")
    assert_equal 1, @round1.card_index
  end

  def test_correct_turns_count_increases
    @round1.take_turn("answer1")
    assert_equal 1, @round1.correct_turns.count
  end

  def test_incorrect_turns_count_remains_zero
    @round1.take_turn("answer1")
    assert_equal 0, @round1.incorrect_turns.count
  end

  def test_number_correct_by_category
    @round1.take_turn("answer1")
    @round1.take_turn("answer4")
    assert_equal 1, @round1.number_correct_by_category("category1")
  end

  def test_number_in_category
    @round1.take_turn("answer1")
    @round1.take_turn("answer1")
    @round1.take_turn("answer1")
    assert_equal 2, @round1.number_in_category("category1")
  end

  def test_percent_correct
    @round1.take_turn("answer1")
    @round1.take_turn("answer1")
    @round1.take_turn("answer1")
    assert_equal (100.0/3).round(2), @round1.percent_correct
  end

  def test_percent_correct_by_category
    @round1.take_turn("answer1")
    @round1.take_turn("answer1")
    @round1.take_turn("answer1")
    assert_equal 50.0, @round1.percent_correct_by_category("category1")
  end

end
