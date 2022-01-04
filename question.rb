class Question
  attr_accessor :player
  def initialize
    @player = player
  end

  def randomize 
    random_num_1 = (rand() * 20 + 1).to_i
    random_num_2 = (rand() * 20 + 1).to_i
    return random_num_1, random_num_2
  end
  
  def display_question
    addition_number_1, addition_number_2 = self.randomize
    puts "#{self.player}: What does #{addition_number_1} plus #{addition_number_2} equal ?"
  end

end

question1 = Question.new
question1.display_question