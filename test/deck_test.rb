require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_it_exists
    card1 = Card.new("question1", "answer1", "category1")
    card2 = Card.new("question2", "answer2", "category2")
    card3 = Card.new("question3", "answer3", "category1")
    deck1 = Deck.new([card1, card2, card3])

    assert_instance_of Deck, deck1
  end

  def test_category_search_works
    card1 = Card.new("question1", "answer1", "category1")
    card2 = Card.new("question2", "answer2", "category2")
    card3 = Card.new("question3", "answer3", "category1")
    deck1 = Deck.new([card1, card2, card3])

    assert_equal [card1, card3], deck1.cards_in_category("category1")
  end

  def test_category_search_returns_an_empty_array_if_nothing_matches
    card1 = Card.new("question1", "answer1", :category1)
    card2 = Card.new("question2", "answer2", :category2)
    card3 = Card.new("question3", "answer3", :category1)
    deck1 = Deck.new([card1, card2, card3])

    assert_equal [], deck1.cards_in_category("category4")
  end

  def test_card_count_works
    card1 = Card.new("question1", "answer1", "category1")
    card2 = Card.new("question2", "answer2", "category2")
    card3 = Card.new("question3", "answer3", "category1")
    deck1 = Deck.new([card1, card2, card3])

    assert_equal 3, deck1.count
  end

end
