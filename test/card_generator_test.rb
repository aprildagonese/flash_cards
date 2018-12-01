require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require './lib/cards.txt'

class CardGeneratorTest < MiniTest::Test

  def test_it_exists
    card_gen_1 = CardGenerator.new
