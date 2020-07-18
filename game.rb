# require_relative "app"
require 'timeout'
countries = File.read("./country.rb")
country = countries.split
katakana = /\A(?:\p{Katakana}|[ー-]|)+\z/
Timeout.timeout(10.0) {|lim| "Time limit = #{lim}" }

shisa_input = country.sample
puts "シーサー:#{shisa_input}"
puts "語尾が「ン」で終わってます。あなたの勝ちです！" if shisa_input[-1]  == "ン"
puts "-" * 45

answered_country_name = []
answered_country_name.unshift(shisa_input)

if answered_country_name.count - answered_country_name.uniq.count > 0
  puts "回答済です。ゲーム終了！"
  answered_country_name.shift
else
  shisa_input
end

loop do
  print "あなた："
  user_input = gets.chomp.to_s
  if user_input =~ katakana
    if shisa_input[-1] != user_input[0]
      if country.find { |c| c == user_input }
        if user_input[-1] == "ン"
          puts "語尾が「ン」で終わっています。あなたの負けです！残念！"
          exit
        else
          answered_country_name.unshift(user_input)
          user_input
          break
        end
      else
        puts "そのような国名はありません。正しい国名を入力してください。"
      end
    else
      puts "「#{shisa_input[-1]}」から始まる国名を入力してください。"
    end
  else
    puts "カタカナで入力して下さい。"
  end
end

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