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

  private
  

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
    if timeout.class == "Shisa"
      Shisa::Timeout.lose
    else time.class == "User"
      User::Timeout.lose
    end
  end

  module Shisa
    class Timeout
      def lose
        puts "ターイムアウト!"
        sleep 1.0
        puts "あなたの勝ちです！"
        puts "========================================"
        exit
      end
    end
  end

  module User
    class Timeout
      def lose
        puts "ターイムアウト！"
        sleep 1.0
        puts "あなたの負けです！"
        puts "========================================"
        exit
      end
    end
  end
end
