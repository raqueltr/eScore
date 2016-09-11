puts "Opening the eScore"

puts "What is your id?"
id = $stdin.gets.chomp
puts "What question would you like to answer?"
question_number = gets.chomp

puts "Here is your question:"

target = open("out.txt", 'a+')
puts target.readline  #=> Linha 1

puts "What is your answer to this question?"
answer = $stdin.gets.chomp

record = puts "This is your confirmation: Your id is #{id} and your answer to question #{question_number} is #{answer}"

target.write(answer)
target.write("\n")
target.write(record)
target.close



