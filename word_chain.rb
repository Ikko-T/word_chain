class WordChain
  KATAKANA = /\A(?:\p{Katakana}|[ー・]|)+\z/

  def initialize
    @count = 0
    @history_record = []
  end

  def game_start(shisa, user)
    shisa.greet
    loop do
      puts "***#{@count += 1}ターン目***"
      batting(@count, shisa)
      fielding(user)
    end
  end

  private

  def batting(@count, shisa)
    @turn = "shisa"
    if @count == 1
      @country = shisa.initial_answer
      validate_last_letter
      validate_duplication
    else
      Timeout.timeout(20) {|lim| "Time limit = #{lim}" }
      begin
        @country = shisa.answer
        give_up if @country.nil?
        validate_last_letter
        validate_duplication
      rescue Timeout::Error
        timeout
      end
    end
  end

  def fielding(user)
    @turn = "user"
    Timeout.timeout(20) {|lim| "Time limit = #{lim}" }
    begin
      @country = user.answer
      redo unless letter_check && exist && Country.last_char == @country[0]
      Country.insert_history_record(@country)
      validate_last_letter
      validate_duplication
    rescue Timeout::Error
      timeout
    end
  end

  def letter_check
    match = @country =~ KATAKANA
    unless match
      puts "ひらがな又はカタカナで入力してください。"
      puts "========================================"
    end
    match
  end

  def exist
    match = Country.search_same(@country)
    unless match
      puts "そのような国名はありません。"
      puts "正しい国名を入力してください。"
      puts "========================================"
    end
    match
  end

  def give_up
    puts "頭に浮かばないさぁ〜、降参するさぁ〜"
    win_or_lose
  end

  def validate_last_letter
    puts "語尾が「ン」で終わっています。" if Country.last_letter_fail?(@country)
    win_or_lose
  end

  def validate_duplication
    puts "すでに回答済です。" if Country.duplicate?(@country)
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
