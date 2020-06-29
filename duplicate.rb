# counts = gets.to_i
# strings = []
# counts.times do |i|
#   string = gets.to_s.strip.downcase.chomp
#   if strings.include?(string)
#     strings.delete(string)
#     strings << string
#   else
#     strings << string
#   end
# end

# (strings.length-1).downto(0) do |i|
#   puts strings[i]
# end

answered_country = []

country = gets.to_s
answered_country.unshift(country)
p answered_country
