require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# class RoundTest < Minitest::Test
#
#   def test_general
#     card1 = Card.new("question1", "answer1", "category1")
#     card2 = Card.new("question2", "answer2", "category2")
#     card3 = Card.new("question3", "answer3", "category1")
#     deck1 = Deck.new([card1, card2, card3])
#     round1 = Round.new(deck1)
#     new_turn = round1.take_turn("Juneau")
#
# end

puts card1 = Card.new("question1", "answer1", "category1")
puts card2 = Card.new("question2", "answer2", "category2")
puts card3 = Card.new("question3", "answer3", "category1")
puts deck1 = Deck.new([card1, card2, card3])
puts round1 = Round.new(deck1)
puts round1.deck

def test_
