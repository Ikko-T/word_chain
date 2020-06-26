hiragana = /\A(?:\p{Hiragana}|[ー-]|)+\z/

puts "ひらがなで入力してください"
input = gets.chomp

if hiragana =~ input
    puts "#{input}"
else
    puts "入力値が不正です。ひらがなで入力してください"
end
puts "=" * 15
