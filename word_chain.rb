class WordChain
  def initialize
    @count = 0
    @history_record = []
  end

  def game_start(shisa, user)
    # shisa.greet
    loop do
      @count += 1
      shisa.batting(@count)
      user.fielding
    end
  end

  def validate_last_letter(country)
    puts "語尾が「ン」で終わっています。" if Country.last_letter_fail?(country)
    country
  end

  def validate_duplication(country)
    puts "すでに回答済です。" if Country.duplicate?(country)
    country
  end

  def give_up
    puts "頭に浮かばないさぁ〜、降参するさぁ〜"
    shisa_lose
  end

  def timeout
    puts "ターイムアウト!"
    shisa_lose || user_lose
  end

  def shisa_lose
    sleep 1.0
    puts "あなたの勝ちです！"
    puts "========================================"
    exit
  end

  def user_lose
    sleep 1.0
    puts "あなたの負けです！"
    puts "========================================"
    exit
  end
end
