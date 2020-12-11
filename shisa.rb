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
    validate_last_letter(country_name)
    validate_duplication(country_name)
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
      validate_last_letter(country_name)
      validate_duplication(country_name)
      country_name
    end
  end

  def think(country)
    puts "シーサー考え中、、、"
    print "シーサー: "
    sleep(rand(1..21))
    country_name = Country.grab_on_behind
    Country.insert_history_record(country_name)
    give_up if country_name.nil?
    puts "#{country_name}"
    puts "========================================"
    country_name
  end
end
