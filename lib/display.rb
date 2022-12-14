require 'colorize'
require 'colorized_string'

total_array = [
  [:light_black, :light_black, :light_black, :light_black, :light_black, :light_black, :light_black,],
  [:red, :light_black, :light_black, :light_black, :light_black, :light_black, :light_black,],
  [:yellow, :light_black, :red, :light_black, :red, :light_black, :red],
  [:yellow, :yellow, :red, :yellow, :red, :yellow, :yellow],
  [:yellow, :red, :red, :red, :yellow, :yellow, :yellow],
  [:red, :red, :red, :yellow, :yellow, :yellow, :red]
]

def print_row(color_array)
  color_array.each do |color|
    print " |".colorize(:light_black)
    if color.nil? || color == :light_black # Remove light black after fully implement. Only for testing.
      print "  "
    else 
      print " O".colorize(color.to_sym)
    end
  end
  print " | \n".colorize(:light_black)
end

print_row(total_array)

puts ""
total_array.each do |row|
  print_row(row)
end

puts " ----------------------------- "
puts " |                           | "
puts "_|_                         _|_"
puts ""