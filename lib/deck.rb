require './lib/card'
require './lib/turn'
require 'pry'

class Deck
  attr_accessor :cards, :cards_in_category, :count

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(category)
    @cards_in_category = @cards.map do |card|
      if card.category == category
        card
      end
    end
  end

end
binding.pry

#pry requires not working
#need nil in test_category_search_works?
#
