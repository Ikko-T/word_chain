class Shisa
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
    selected_country = country.choose_random
    puts "シーサー: #{selected_country}"
    puts "========================================"
    selected_country
  end

  def validate(country, selected_country)
    win if country.word_end?(selected_country)
  end

  def answer(count, country)
    Timeout.timeout(20) do
      puts "***#{count}ターン目***"
      selected_country = turn(country)
      win if country.word_end?(selected_country) || country.duplicate?
    end
  end

  def turn(country)
    puts "シーサー考え中、、、"
    print "シーサー: "
    sleep(rand(1..21))
    selected_country = country.choose_answer
    give_up if selected_country.nil?
    puts "#{selected_country}"
    puts "========================================"
    selected_country
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
