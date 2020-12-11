class Shisa
  include Instruction

  def action(count)
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
    country = come_up
    validate_last_letter(country)
    validate_duplication(country)
    country
  end

  def come_up
    country = Country.choose_random
    Country.insert_history_record(country)
    puts "シーサー: #{country}"
    puts "========================================"
    country
  end

  def answer(count)
    Timeout.timeout(20) do
      puts "***#{count}ターン目***"
      country = think
      validate_last_letter(country)
      validate_duplication(country)
      country
    end
  end

  def think
    puts "シーサー考え中、、、"
    print "シーサー: "
    sleep(rand(1..21))
    country = Country.choose_intentional
    Country.insert_history_record(country)
    give_up if country.nil?
    puts "#{country}"
    puts "========================================"
    country
  end
end
