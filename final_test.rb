require_relative "app"
require 'timeout'
require 'pry'

katakana = /\A(?:\p{Katakana}|[ー-]|)+\z/
countries = File.read("./country.rb")

country = countries.split
shisa_input = country.sample
is_duplicate = []
is_duplicate.unshift(shisa_input)

loop do
  user = ""
  Timeout.timeout(20.0) {|lim| "Time limit = #{lim}" }
  begin
    Timeout.timeout(20.0) do
      puts "シーサー: #{shisa_input}"  
      shisa = shisa_input.delete('ー-').tr('ァィゥェォッャュョヮ', 'アイウエオツヤユヨワ')
      puts "「#{shisa[-1]}」から始まる国名を入力して下さい。"
      puts "=" * 40

      if shisa_input[-1]  == "ン"
        sleep 1.5
        puts "語尾が「ン」で終わってます・・・。" 
        puts "あなたの勝ちです!"
        puts "=" * 40
        exit
      end

      shisa_choices = country.select { |c| c[0] == user[-1] }
      shisa_input = shisa_choices.sample
      puts "シーサー考え中、、、"
      print "シーサー: "
      sleep(rand(1..22))
      puts "#{shisa_input}"
      puts "=" * 40

      is_duplicate.unshift(shisa_input)
      if is_duplicate.count - is_duplicate.uniq.count > 0
        puts "すでに回答済です。"
        sleep 1.0
        puts "あなたの勝ちです！"
        puts "=" * 40
        exit
      end
      
    end
  rescue Timeout::Error
    puts "ターイムアウト! あなたの勝ちです！"
    puts "=" * 40
    $!
    exit
  end

  begin
    Timeout.timeout(20.0) do
      print "あなた: "
      user_input = gets.chomp.to_s
      puts "=" * 40
      
      unless user_input =~ katakana
        puts "カタカナで入力してください。"
        redo unless user_input =~ katakana
      end

      unless shisa[-1] == user_input[0]
        puts "しりとりができていません。"
        puts "再度、入力してください。"
        redo unless shisa[-1] == user_input[0]
      end

      unless country.find { |c| c == user_input }
        puts "そのような国名はありません。"
        puts "正しい国名を入力してください。"
        redo unless country.find { |c| c == user_input}
      end

      unless user_input[-1] != "ン"
        puts "語尾が「ン」で終わっています。"
        puts "あなたの負けです！"
        puts "=" * 40
        exit
      end

      is_duplicate.unshift(user_input)
      if is_duplicate.count - is_duplicate.uniq.count > 0
        puts "すでに回答済です。"
        puts "あなたの負けです！"
        puts "=" * 40
        exit
      end

      user = user_input.delete('ー-').tr('ァィゥェォッャュョヮ', 'アイウエオツヤユヨワ')
      
    end
  rescue Timeout::Error
    puts "ターイムアウト! あなたの負けです！"
    puts "=" * 40
    $!
    exit
  end
end