class User
  include Country
  KATAKANA = /\A(?:\p{Katakana}|[ー・]|)+\z/

  def action(country)
    Timeout.timeout(20) {|lim| "Time limit = #{lim}" }
    begin
      answer(country)
    rescue Timeout::Error
      timeout
    end
  end

  private

  def answer(country)
    Timeout.timeout(20) do
      puts "「#{country.last_char}」から始まる国名を入力して下さい。"
      selected_country = turn
      redo unless validate(selected_country) && correct?(country, selected_country) && country.last_char == selected_country[0]
      country.insert_history_record(selected_country)
      if country.last_letter_fail?(selected_country) || country.duplicate?
        puts "すでに回答済です。"
        lose
      end
    end
  end

  def turn
    print "あなた: "
    selected_country = transform(gets.chomp)
    puts "========================================"
    selected_country
  end

  def transform(selected_country)
    NKF.nkf("--katakana -w", selected_country).tr("　･−"," ・ー").strip
  end

  def validate(selected_country)
    match = selected_country =~ KATAKANA
    unless match
      puts "ひらがな又はカタカナで入力してください。"
      puts "========================================"
    end
    match
  end

  def correct?(country, selected_country)
    match = country.confirm(selected_country)
    unless match
      puts "そのような国名はありません。"
      puts "正しい国名を入力してください。"
      puts "========================================"
    end
    match
  end

  def timeout
    puts "ターイムアウト!"
    lose
  end

  def lose
    sleep 1.0
    puts "あなたの負けです！"
    puts "========================================"
    exit
  end
end
