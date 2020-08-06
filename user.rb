class User
  KATAKANA = /\A(?:\p{Katakana}|[ー・]|)+\z/

  def action(country)
    Timeout.timeout(20) {|lim| "Time limit = #{lim}" }
    begin
      answer_time(country)
    rescue Timeout::Error
      timeout
    end
  end

  private

  def answer_time(country)
    Timeout.timeout(20) do
      puts "「#{country.last_char}」から始まる国名を入力して下さい。"
      input = turn
      redo unless validate(input) && country.confirm(input) && country.last_char == input[0]
      country.insert(input)
      lose if country.word_end?(input) || country.duplicate?
    end
  end

  def turn
    print "あなた: "
    input = transform(gets.chomp)
    puts "=" * 40
    input
  end

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

  def timeout
    puts "ターイムアウト!"
    sleep 1.0
    lose
  end

  def transform(input)
    NKF.nkf("--katakana -w", input)
  end
end
