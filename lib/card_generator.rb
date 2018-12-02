require './lib/card'

class CardGenerator
  attr_reader :card_data_array, :future_cards, :cards

  def initialize(filename)
    @filename = filename
    turn_into_cards
  end

  private

  def turn_into_cards
    read_file
    normalize_data
    generate_card_objects
  end

  def read_file
    @card_data_array = File.readlines(@filename)
  end

  def normalize_data
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
