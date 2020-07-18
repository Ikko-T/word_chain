katakana = /\A(?:\p{Katakana}|[ー-]|)+\z/

puts "カタカナで入力してください"
input = gets.chomp

if katakana =~ input
    puts "#{input}"
else
    puts "入力値が不正です。カタカナで入力してください"
end
puts "=" * 35
