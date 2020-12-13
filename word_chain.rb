class WordChain
  KATAKANA = /\A(?:\p{Katakana}|[ー・]|)+\z/

  def initialize
    @count = 0
    Country.record
  end

  def game_start(shisa, user)
    shisa.greet
    loop do
      batting(shisa)
      fielding(user)
    end
  end

  private

  def batting(shisa)
    @turn = "shisa"
    puts "***#{@count += 1}ターン目***"
    if @count == 1
      @country = shisa.initial_answer
      Country.insert_history_record(@country)
      win_or_lose if validate_last_letter
      win_or_lose if validate_duplication
    else
      Timeout.timeout(20) {|lim| "Time limit = #{lim}" }
      begin
        Timeout.timeout(20) do
          @country = shisa.answer
          Country.insert_history_record(@country)
          give_up if @country.nil?
          win_or_lose if validate_last_letter
          win_or_lose if validate_duplication
        end
      rescue Timeout::Error
        timeout
      end
    end
  end

  def fielding(user)
    @turn = "user"
    Timeout.timeout(20) {|lim| "Time limit = #{lim}" }
    begin
      Timeout.timeout(20) do
        @country = user.answer
        redo unless letter_check && exist && Country.last_char == @country[0]
        Country.insert_history_record(@country)
        win_or_lose if validate_last_letter
        win_or_lose if validate_duplication
      end
    rescue Timeout::Error
      timeout
    end
  end

  def letter_check
    hiragana_katakana = @country =~ KATAKANA
    unless hiragana_katakana
      puts "ひらがな又はカタカナで入力してください。"
      puts "========================================"
    end
    hiragana_katakana
  end

  def exist
    country = Country.equal(@country)
    unless country
      puts "そのような国名はありません。"
      puts "正しい国名を入力してください。"
      puts "========================================"
    end
    country
  end

  def validate_last_letter
    last_letter = Country.last_letter_fail(@country)
    if last_letter
      puts "語尾が「ン」で終わっています。"
    end
    last_letter
  end

  def validate_duplication
    duplication = Country.duplicate
    if duplication
      puts "すでに回答済です。"
    end
    duplication
  end

  def give_up
    puts "頭に浮かばないさぁ〜、降参するさぁ〜"
    win_or_lose
  end

  def timeout
    puts "ターイムアウト！"
    win_or_lose
  end

  def win_or_lose
    judge = @turn == "shisa" ? "勝ち" : "負け"
    sleep 1.0
    puts "あなたの#{judge}です！"
    puts "========================================"
    exit
  end
end
