puts "Opening the eScore"
target = open("out.txt", 'w')
target.truncate(0)

puts "What question would you like to add?"

print "Question 1: "
line1 = $stdin.gets.chomp

puts "I'm going to publish it."

target.write(line1)
target.write("\n")

puts "And finally, we close it."
target.close