class WordChain
  KATAKANA = /\A(?:\p{Katakana}|[ー・]|)+\z/

  def initialize
    @count = 0
    @history_record = []
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
      @history_record << @country
      @country_last_letter = get_last_letter
      win_or_lose if end_with_N?
    else
      Timeout.timeout(20) {|lim| "Time limit = #{lim}" }
      begin
        Timeout.timeout(20) do
          @country = shisa.answer(@country_last_letter)
          @history_record << @country
          @country_last_letter = get_last_letter
          win_or_lose if country_nil? || end_with_N? || duplicate?
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
        puts "「#{@country_last_letter}」から始まる国名を入力して下さい。"
        @country = user.answer
        redo unless is_hiragana_katakana? && exist? && last_meet_first?
        @history_record << @country
        @country_last_letter = get_last_letter
        win_or_lose if end_with_N? || duplicate?
      end
    rescue Timeout::Error
      timeout
    end
  end

  def get_last_letter
    Country.last_char(@country) unless @country.nil?
  end

  def is_hiragana_katakana?
    is_valid = @country =~ KATAKANA
    unless is_valid
      puts "ひらがな又はカタカナで入力してください。"
      puts "========================================"
    end
    is_valid
  end

  def exist?
    is_valid = Country.equal(@country)
    unless is_valid
      puts "そのような国名はありません。"
      puts "正しい国名を入力してください。"
      puts "========================================"
    end
    is_valid
  end

  def last_meet_first?
    is_valid = @country_last_letter == @country[0]
  end

  def end_with_N?
    is_valid = @country_last_letter == "ン"
    puts "語尾が「ン」で終わっています。" if is_valid
    is_valid
  end

  def duplicate?
    is_valid = Country.duplicate(@history_record)
    puts "すでに回答済です。" if is_valid
    is_valid
  end

  def country_nil?
    is_valid = @country.nil?
    puts "頭に浮かばないさぁ〜、降参するさぁ〜" if is_valid
    is_valid
  end

  def timeout
    puts "ターイムアウト！"
    win_or_lose
  end

  def win_or_lose
    judgement = @turn == "shisa" ? "勝ち" : "負け"
    sleep 1.0
    puts "あなたの#{judgement}です！"
    puts "========================================"
    exit
  end
end
