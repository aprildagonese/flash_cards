require 'pry'

class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question.to_s
    @answer = answer.to_s
    @category = category.to_s
  end

end
