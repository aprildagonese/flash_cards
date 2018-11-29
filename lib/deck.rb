require './lib/card'
require './lib/turn'
require 'pry'

class Deck
  attr_accessor :cards, :count

  def initialize(cards)
    @cards = cards
    @count = cards.count #consider separating into different method
  end

  def cards_in_category(category)
    @cards.select do |card|
      card.category.to_s == category.to_s
    end
  end

end
