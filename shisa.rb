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
        shisa_timeout
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
      country_name = think(country)
      judge_shisa(country_name)
    end
  end

  def think(country)
    puts "シーサー考え中、、、"
    print "シーサー: "
    sleep(rand(1..21))
    answer = Country.grab_on_behind
    Country.insert_history_record(answer)
    give_up if answer.nil?
    puts "#{answer}"
    puts "========================================"
    answer
  end

end
