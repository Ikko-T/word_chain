class User
  KATAKANA = /\A(?:\p{Katakana}|[ー・]|)+\z/

  def fielding
    Timeout.timeout(20) {|lim| "Time limit = #{lim}" }
    begin
      answer
    rescue Timeout::Error
      timeout
    end
  end

  private

  def answer
    Timeout.timeout(20) do
      puts "「#{Country.last_char}」から始まる国名を入力して下さい。"
      country = come_up
      redo unless letter_check(country) && exist?(country) && Country.last_char == country[0]
      Country.insert_history_record(country)
      validate_last_letter(country)
      validate_duplication(country)
      country
    end
  end

  def come_up
    print "あなた: "
    country = transform(gets.chomp)
    puts "========================================"
    country
  end

  def transform(country)
    NKF.nkf("--katakana -w", country).tr("　･−"," ・ー").strip
  end

  def letter_check(country)
    match = country =~ KATAKANA
    unless match
      puts "ひらがな又はカタカナで入力してください。"
      puts "========================================"
    end
    match
  end

  def exist?(country)
    match = Country.search_same(country)
    unless match
      puts "そのような国名はありません。"
      puts "正しい国名を入力してください。"
      puts "========================================"
    end
    match
  end
end
