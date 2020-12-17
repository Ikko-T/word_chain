class Shisa
  include Instruction

  def initial_answer
    country = Country.random
    puts "シーサー: #{country}"
    puts "========================================"
    country
  end

  def answer(last_letter)
    puts "シーサー考え中、、、"
    print "シーサー: "
    sleep(rand(1..21))
    country = Country.grab_on_behind(last_letter)
    puts "#{country}"
    puts "========================================"
    country
  end
end
