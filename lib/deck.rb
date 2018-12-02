require './lib/card'
require './lib/turn'
require 'pry'

class Deck
  attr_reader :cards, :count

  def initialize(cards)
    @cards = cards
  end

  def categories
    categories = cards.map do |card|
      card.category
    end
    categories.uniq
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
