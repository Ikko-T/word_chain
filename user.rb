class User
  KATAKANA = /\A(?:\p{Katakana}|[ー-]|)+\z/

  def action(country)
    Timeout.timeout(20) {|lim| "Time limit = #{lim}" }
    begin
      Timeout.timeout(20) do
        puts "「#{country.last_char}」から始まる国名を入力して下さい。"
        print "あなた: "
        input = gets.chomp
        puts "=" * 40
        redo unless validate(input) && country.confirm(input)
        country.insert(input)
        lose if country.word_end?(input) || country.duplicate?
      end
    rescue Timeout::Error
      puts "ターイムアウト!"
      sleep 1.0
      puts "あなたの負けです！"
      puts "=" * 40
      exit
    end
  end

  private

  def validate(input)
    match = input =~ KATAKANA
    unless match
      puts "カタカナで入力してください。"
      puts "=" * 40
    end
    match
  end

  def lose
    puts "あなたの負けです！"
    puts "=" * 40
    exit
  end
end
