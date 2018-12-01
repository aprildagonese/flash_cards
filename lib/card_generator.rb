class CardGenerator
  attr_reader :card_data_array

  def initialize
    turn_into_cards
  end

  def turn_into_cards
    turn_to_array
    turn_to_subarrays
  end

  def turn_to_array
    @card_data_array = File.readlines('./lib/cards.txt')
  end

  def turn_to_subarrays
    individual_cards = []
    @card_data_array.each do |string|
      individual_cards << string.chomp.split(",")
    end
    p individual_cards
  end

end

CardGenerator.new
