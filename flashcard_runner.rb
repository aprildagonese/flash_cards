require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

Round.new(Deck.new(CardGenerator.new('./lib/cards.txt').cards)).start
