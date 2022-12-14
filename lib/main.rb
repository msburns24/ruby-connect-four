require_relative 'board'
require 'colorize'
require 'colorized_string'

# puts ColorizedString.colors

# puts "Test grey color".colorize(:light_black)

########
#### This one has blanks instead of grey O's, looks better for acutal game.
# 
# def print_row(color_array)
#   color_array.each do |color|
#     print " |".colorize(:light_black)
#     if color == :light_black
#       print "  "
#     else 
#       print " O".colorize(color)
#     end
#   end
#   print " | \n".colorize(:light_black)
# end

def print_row(color_array)
  color_array.each do |color|
    print " |".colorize(:light_black)
    print " O".colorize(color)
  end
  print " | \n".colorize(:light_black)
end

total_array = [
  [:light_black, :light_black, :light_black, :light_black, :light_black, :light_black, :light_black,],
  [:red, :light_black, :light_black, :light_black, :light_black, :light_black, :light_black,],
  [:yellow, :light_black, :red, :light_black, :red, :light_black, :red],
  [:yellow, :yellow, :red, :yellow, :red, :yellow, :yellow],
  [:yellow, :red, :red, :red, :yellow, :yellow, :yellow],
  [:red, :red, :red, :yellow, :yellow, :yellow, :red]
]

puts ""
total_array.each do |row|
  print_row(row)
end

puts " ----------------------------- "
puts " |                           | "
puts "_|_                         _|_"
puts ""



# | O | O | O | O | O | O | O |
# | O | O | O | O | O | O | O |
# | O | O | O | O | O | O | O |
# | O | O | O | O | O | O | O |
# | O | O | O | O | O | O | O |
# | O | O | O | O | O | O | O |
# -----------------------------
# |                           |
#_|_                         _|_