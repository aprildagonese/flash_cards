require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class CardGeneratorTest < MiniTest::Test

  def setup
    @card_gen_1 = CardGenerator.new('./test/test_cards.txt')
  end

  def test_it_exists
    @card_gen_1
    assert_instance_of CardGenerator, @card_gen_1
  end

  def test_correct_number_of_cards
    assert_equal 2, @card_gen_1.cards.count
  end

  def test_cards_contains_an_array_of_cards
    @card_gen_1
    assert_equal true, @card_gen_1.cards.is_a?(Array)
  end

  def test_first_card_has_the_correct_question
    @card_gen_1
    assert_equal "Who am I?", @card_gen_1.cards[0].question
  end

  def test_first_card_has_the_correct_answer
    @card_gen_1
    assert_equal "April", @card_gen_1.cards[0].answer
  end

  def test_first_card_has_the_correct_category
    @card_gen_1
    assert_equal "person", @card_gen_1.cards[0].category
  end

end
