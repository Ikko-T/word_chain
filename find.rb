# require "./country"

input = gets.chomp
country = ["アメリカ", "ニホン", "ザマ"]
if country.find { |c| c == input}
  puts input
else
  puts "正しい国名を入力してください"
end