class Homework
def think
puts "You have to think about learning"
end
  def write_code
puts 'You have to write code'
  end
  def read_book
puts 'You have to read a lot'
  end
end
idea = Homework.new
exercise1 = Homework.new
exercise2 = Homework.new
tutorial = Homework.new

idea.think
idea.write_code
idea.read_book
tutorial.read_book
