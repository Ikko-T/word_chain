 class Shisa
  def action(count, country)
    if count == 1
      input = country.begin
      puts "***#{count}ターン目***"
      puts "シーサー: #{input}"
      puts "=" * 40
      validate(input)
    else
      Timeout.timeout(20) {|lim| "Time limit = #{lim}" }
      begin
        Timeout.timeout(20) do
          puts "***#{count}ターン目***"
          puts "シーサー考え中、、、"
          print "シーサー: "
          sleep(rand(1..22))
          input = country.choose
          win if input.nil?
          puts "#{input}"
          puts "=" * 40
          win if country.word_end?(input) || country.duplicate?
        end
      rescue Timeout::Error
        puts "ターイムアウト!"
        sleep 1.0
        puts "あなたの勝ちです！"
        puts "=" * 40
        exit
      end
    end
  end

  private

  def validate(input)
    last_char = input[-1] == "ン"
    if last_char
      sleep 1.0
      puts "語尾が「ン」で終わっています。"
      sleep 1.0
      puts "あなたの勝ちです！"
      puts "=" * 40
      exit
    end
  end

  def win
    puts "あなたの勝ちです！"
    puts "=" * 40
    exit
  end
end
