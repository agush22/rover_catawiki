require './robo'

#Get input
puts "Test Input:"
m = gets.strip.to_i
x1,y1,p1 = gets.strip.split(' ')
ins1 = gets.strip
x2,y2,p2 = gets.strip.split(' ')
ins2 = gets.strip

#Create Rovers
r1 = Rover.new(x1.to_i,y1.to_i,p1)
r1.instruction(ins1)
r2 = Rover.new(x2.to_i,y2.to_i,p2)
r2.instruction(ins2)

#Write results
puts "Output:"
puts r1
puts r2
