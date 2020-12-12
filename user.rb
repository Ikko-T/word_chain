class User
  
  def answer
    Timeout.timeout(20) do
      puts "「#{Country.last_char}」から始まる国名を入力して下さい。"
      print "あなた: "
      country = transform(gets.chomp)
      puts "========================================"
      country
    end
  end

  def transform(country)
    NKF.nkf("--katakana -w", country).tr("　･−"," ・ー").strip
  end
end
