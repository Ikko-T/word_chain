# require "./test2"

# シーサーが先行の場合の処理
shisa_input = "るーまにあ"
end_word = shisa_input[-1]
puts shisa_input
puts "あなたの番です。#{end_word}から始まる国名をひらがなで入力してください。"
puts "=" * 15
you_input = gets.chomp
beginning_word = you_input[0]

if end_word == beginning_word
    puts "#{you_input}"
else
    puts "しりとりができていません"
end
