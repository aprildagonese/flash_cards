require './lib/card'

class CardGenerator
  attr_reader :card_data_array, :future_cards, :cards

  def initialize(filename)
    @filename = filename
    turn_into_cards
  end

  def turn_into_cards
    turn_to_array
    turn_to_subarrays
    generate_card_objects
  end

  def turn_to_array
    @card_data_array = File.readlines(@filename)
  end

  def turn_to_subarrays
    @future_cards = @card_data_array.map do |card_data|
      card_data.chomp.split(",")
    end
  end

  def generate_card_objects
    @cards = @future_cards.map do |card_args|
      Card.new(*card_args)
    end
  end

end
