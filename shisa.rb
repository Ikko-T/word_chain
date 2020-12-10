class Shisa
  include Instruction

  def action(count)
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
    country_name = come_up(country)
    judge_shisa(country_name)
  end

  def come_up(country)
    country_name = Country.choose_random
    Country.insert_history_record(country_name)
    puts "シーサー: #{country_name}"
    puts "========================================"
    country_name
  end

  def answer(count, country)
    Timeout.timeout(20) do
      puts "***#{count}ターン目***"
      country_name = turn(country)
      if Country.last_letter_fail?(country_name) || country.duplicate?
        puts "すでに回答済です。"
        win
      end
    end
  end

  def turn(country)
    puts "シーサー考え中、、、"
    print "シーサー: "
    sleep(rand(1..21))
    answer = Country.choose_answer
    Country.insert_history_record(answer)
    give_up if answer.nil?
    puts "#{answer}"
    puts "========================================"
    answer
  end

  # def timeout
  #   puts "ターイムアウト!"
  #   win
  # end

  # def give_up
  #   puts "頭に浮かばないさぁ〜、降参するさぁ〜"
  #   win
  # end

  # def win
  #   sleep 1.0
  #   puts "あなたの勝ちです！"
  #   puts "========================================"
  #   exit
  # end
end
