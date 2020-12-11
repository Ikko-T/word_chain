class Shisa
  include Instruction

  def batting(count)
    if count == 1
      initial_answer(count)
    else
      Timeout.timeout(20) {|lim| "Time limit = #{lim}" }
      begin
        answer(count)
      rescue Timeout::Error
        timeout
      end
    end
  end

  private

  def initial_answer(count)
    puts "***#{count}ターン目***"
    come_up
  end

  def come_up
    country = Country.choose_random
    Country.insert_history_record(country)
    validate_last_letter(country)
    validate_duplication(country)
    puts "シーサー: #{country}"
    puts "========================================"
    country
  end

  def answer(count)
    Timeout.timeout(20) do
      puts "***#{count}ターン目***"
      thinking
    end
  end

  def thinking
    puts "シーサー考え中、、、"
    print "シーサー: "
    sleep(rand(1..21))
    country = Country.choose_intentional
    Country.insert_history_record(country)
    give_up if country.nil?
    validate_last_letter(country)
    validate_duplication(country)
    puts "#{country}"
    puts "========================================"
    country
  end
end
