class User
  KATAKANA = /\A(?:\p{Katakana}|[ー・]|)+\z/

  def action(country)
    Timeout.timeout(20) {|lim| "Time limit = #{lim}" }
    begin
      answer(country)
    rescue Timeout::Error
      user_timeout
    end
  end

  private

  def answer(country)
    Timeout.timeout(20) do
      puts "「#{Country.last_char}」から始まる国名を入力して下さい。"
      country_name = come_up
      redo unless validate(country_name) && exist?(country, country_name) && country.last_char == country_name[0]
      country.insert_history_record(country_name)
      judge_user(country_name)
    end
  end

  def come_up
    print "あなた: "
    country_name = transform(gets.chomp)
    puts "========================================"
    country_name
  end

  def transform(country_name)
    NKF.nkf("--katakana -w", country_name).tr("　･−"," ・ー").strip
  end

  def validate(country_name)
    match = country_name =~ KATAKANA
    unless match
      puts "ひらがな又はカタカナで入力してください。"
      puts "========================================"
    end
    match
  end

  def exist?(country_name)
    match = Country.search_same(country_name)
    unless match
      puts "そのような国名はありません。"
      puts "正しい国名を入力してください。"
      puts "========================================"
    end
    match
  end
end
