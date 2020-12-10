class WordChain
  def initialize
    @count = 0
    @history_record = []
  end

  def game_start(shisa, user)
    # shisa.greet
    loop do
      @count += 1
      batting(@count, shisa)
      fielding(user)
    end
  end

  def judge_user(answer)
    if Country.last_letter_fail?(answer)
      puts "語尾が「ン」で終わっています。"
      user_lose
    end
    if Country.duplicate?(answer)
      puts "すでに回答済です。"
      user_lose
    end
  end

  def judge_shisa(answer)
    if Country.last_letter_fail?(answer)
      puts "語尾が「ン」で終わっています。"
      shisa_lose
    end
    if Country.duplicate?(answer)
      puts "すでに回答済です。"
      shisa_lose
    end
  end

  def validate(country, selected_country)
    if Country.last_letter_fail?(selected_country)
      puts "語尾が「ン」で終わっています。"
      shisa_lose
    end
  end

  # shisa
  def timeout
    puts "ターイムアウト!"
    shisa_lose
  end

  def give_up
    puts "頭に浮かばないさぁ〜、降参するさぁ〜"
    shisa_lose
  end

  def shisa_lose
    sleep 1.0
    puts "あなたの勝ちです！"
    puts "========================================"
    exit
  end

  def user_timeout
    puts "ターイムアウト!"
    user_lose
  end

  def user_lose
    sleep 1.0
    puts "あなたの負けです！"
    puts "========================================"
    exit
  end

end
