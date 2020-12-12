class Shisa
  include Instruction

  def initial_answer
    country = Country.choose_random
    Country.insert_history_record(country)
    puts "シーサー: #{country}"
    puts "========================================"
    country
  end

  def answer
    Timeout.timeout(20) do
      puts "シーサー考え中、、、"
      print "シーサー: "
      sleep(rand(1..21))
      country = Country.choose_given
      Country.insert_history_record(country)
      puts "#{country}"
      puts "========================================"
      country
    end
  end
end
