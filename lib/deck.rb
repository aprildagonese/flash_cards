require './lib/card'
require './lib/turn'
require 'pry'

class Deck
  attr_accessor :cards, :count

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    @cards.select do |card|
      card.category == category
    end
  end

end
