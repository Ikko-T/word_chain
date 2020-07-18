# require_relative "app"
require 'timeout'
countries = File.read("./country.rb")
country = countries.split
katakana = /\A(?:\p{Katakana}|[ー-]|)+\z/

# 国名リストからランダムに一国を出力、かつ配列に格納
# 出力国名の語尾が「ン」で終わったらゲーム終了
# shisa_input = country.sample
# answered_country_name = []
# answered_country_name.unshift(shisa_input)
# puts "シーサー:#{shisa_input}"
# if shisa_input[-1]  == "ン"
#   puts "語尾が「ン」で終わってます・・・。  "
#   sleep 1.0
#   puts "あなたの勝ちです!"
#   puts "-" * 45
#   exit
# end
shisa_input = "カンコク"

# 出力された国名の語尾が長音で終わる場合は長音の一つ前の語尾から始める
if shisa_input[-1].match?(/[ー-]\z/)
  shisa_input = shisa_input.chop.tr('ァィゥェォッャュョヮ', 'アイウエオツヤユヨワ')
  puts "「#{shisa_input[-1]}」から始まる国名を入力して下さい。"
else
  puts "「#{shisa_input[-1]}」から始まる国名を入力して下さい。"
end

# カタカナ入力の確認
print "あなた:"
user_input = gets.chomp.to_s
if user_input =~ katakana
  puts user_input
else
  puts "カタカナで入力してください。"
  # 入力場面に戻りたい
end

# 先頭と末尾の語の一致確認
# 長音で終わる場合をどうするか？
if shisa_input[-1] != user_input[0]
  puts "しりとりができていません。再度、入力してください。"
  # 入力場面に戻りたい
else
  puts user_input
end

# 存在する国名かどうかを確認
user_input
if country.find { |c| c == user_input }
  puts user_input
else
  puts "そのような国名はありません。正しい国名を入力してください。"
  # 入力場面に戻りたい
end

# 入力値の語尾確認
user_input
if user_input[-1] == "ン"
  puts "語尾が「ン」で終わっています。あなたの負けです！残念！"
  exit
else
  puts user_input
end

# 回答済の重複確認
user_input
answered_country_name.unshift(user_input)
if answered_country_name.count - answered_country_name.uniq.count > 0
  puts "回答済です。ゲーム終了！"
  answered_country_name.shift
  exit
else
  puts user_input
end 

Timeout.timeout(10.0) {|lim| "Time limit = #{lim}" }

begin
  Timeout.timeout(10.0) do
    print "あなた："
    user_input = gets.chomp.to_s
  end
rescue
  puts "ターイムアウト!!"
  $!
end


# loop do
#   print "あなた："
#   user_input = gets.chomp.to_s
#   if user_input =~ katakana
#     if shisa_input[-1] != user_input[0]
#       if country.find { |c| c == user_input }
#         if user_input[-1] == "ン"
#           puts "語尾が「ン」で終わっています。あなたの負けです！残念！"
#           exit
#         else
#           answered_country_name.unshift(user_input)
#           user_input
#           break
#         end
#       else
#         puts "そのような国名はありません。正しい国名を入力してください。"
#       end
#     else
#       puts "「#{shisa_input[-1]}」から始まる国名を入力してください。"
#     end
#   else
#     puts "カタカナで入力して下さい。"
#   end
# end

# if user_input =~ katakana
#   if country.find { |c| c == user_input }
#     if user_input[-1] == "ン"
#       puts "語尾が「ン」で終わってます。あなたの負けです！"
#       exit
#     else
#       user_input
#     end
#   else
#     puts "そのような国名はありません。正しい国名を入力してください。"
#   end
# else
#   puts "カタカナで入力して下さい。"
# end


# begin
#   Timeout.timeout(10.0) do
#     print "あなた："
#     user_input = gets.chomp.to_s
#     if user_input =~ katakana
#       if country.find { |c| c == user_input }
#         if user_input[-1] == "ン"
#           puts "語尾が「ン」で終わってます。あなたの負けです！"
#           exit
#         else
#           return user_input
#         end
#       else
#         puts "そのような国名はありません。正しい国名を入力してください。"
#       end
#     else
#       puts "カタカナで入力して下さい。"
#     end
#   end
# rescue
#   puts "ターイムアウト!!"
#   exit
# end