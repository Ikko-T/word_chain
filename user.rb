class User
  KATAKANA = /\A(?:\p{Katakana}|[ー-]|)+\z/

  def turn
    Timeout.timeout(20.0) {|lim| "Time limit = #{lim}" }
    begin
      Timeout.timeout(20.0) do
        shisa = @shisa_input.delete('ー-').tr('ァィゥェォッャュョヮ', 'アイウエオツヤユヨワ')
        puts "「#{shisa[-1]}」から始まる国名を入力して下さい。"
        puts "=" * 40
        print "あなた: "
        user_input = gets.chomp.to_s
        puts "=" * 40
        
        unless user_input =~ KATAKANA
          puts "カタカナで入力してください。"
          puts "=" * 40
          redo unless user_input =~ KATAKANA
        end

        unless @shisa_input[-1] == user_input[0]
          puts "しりとりができていません。"
          puts "再度、入力してください。"
          puts "=" * 40
          redo unless @shisa_input[-1] == user_input[0]
        end

        unless @countries.find { |c| c == user_input }
          puts "そのような国名はありません。"
          puts "正しい国名を入力してください。"
          puts "=" * 40
          redo unless @countries.find { |c| c == user_input}
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
      puts "ターイムアウト!"
      sleep 1.0
      puts "あなたの負けです！"
      puts "=" * 40
      $!
      exit
    end
  end
end
