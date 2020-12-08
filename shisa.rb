class Shisa
  include Instruction
  def action(count, country)
    if count == 1
      initial_answer(count, country)
    else
      Timeout.timeout(20) {|lim| "Time limit = #{lim}" }
      begin
        answer(count, country)
      rescue Timeout::Error
        timeout
      end
    end
  end

  private

  def initial_answer(count, country)
    puts "***#{count}ターン目***"
    selected_country = first_turn(country)
    validate(country, selected_country)
  end

  def first_turn(country)
    answer = country.choose_random
    country.insert_history_record(answer)
    puts "シーサー: #{answer}"
    puts "========================================"
    answer
  end

  def validate(country, selected_country)
    if country.last_letter_fail?(selected_country)
      puts "語尾が「ン」で終わっています。"
      win
    end
  end

  def answer(count, country)
    Timeout.timeout(20) do
      puts "***#{count}ターン目***"
      selected_country = turn(country)
      if country.last_letter_fail?(selected_country) || country.duplicate?
        puts "すでに回答済です。"
        win
      end
    end
  end

  def turn(country)
    puts "シーサー考え中、、、"
    print "シーサー: "
    sleep(rand(1..21))
    answer = country.choose_answer
    country.insert_history_record(answer)
    give_up if answer.nil?
    puts "#{answer}"
    puts "========================================"
    answer
  end

  def timeout
    puts "ターイムアウト!"
    win
  end

  def give_up
    puts "頭に浮かばないさぁ〜、降参するさぁ〜"
    win
  end

  def win
    sleep 1.0
    puts "あなたの勝ちです！"
    puts "========================================"
    exit
  end
end
