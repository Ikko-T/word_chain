class Shisa
  include Instruction

  def initial_answer
    country = Country.choose_random
    puts "シーサー: #{country}"
    puts "========================================"
    country
  end

  def answer
    puts "シーサー考え中、、、"
    print "シーサー: "
    sleep(rand(1..21))
    country = Country.grab_on_behind
    puts "#{country}"
    puts "========================================"
    country
  end
end
