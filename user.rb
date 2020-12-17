class User
  def answer
    print "あなた: "
    country = transform(gets.chomp)
    puts "========================================"
    country
  end

  def transform(country)
    NKF.nkf("--katakana -w", country).tr("　･−"," ・ー").strip
  end
end
