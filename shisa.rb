class Shisa
  def begin
    @shisa_input = @countries.sample
    is_duplicate = [@shisa_input]
    puts "シーサー: #{@shisa_input}"
    if @shisa_input[-1] == "ン"
      sleep 1.5
      puts "語尾が「ン」で終わってます・・・。" 
      puts "あなたの勝ちです!"
      puts "=" * 40
      exit
    end
  end  

  def action(count)
    if count.zero?
      # 最初
      
    else
      # 2回目以降

    end

    Timeout.timeout(20.0) {|lim| "Time limit = #{lim}" }
    begin
      Timeout.timeout(20.0) do
        shisa_choices = @countries.select { |c| c[0] == user[-1] }
        @shisa_input = shisa_choices.sample
        puts "シーサー考え中、、、"
        print "シーサー: "
        sleep(rand(1..22))
        puts "#{@shisa_input}"
        puts "=" * 40

        if @shisa_input[-1] == "ン"
          puts "語尾が「ン」で終わっています。"
          sleep 1.0
          puts "あなたの勝ちです！"
          puts "=" * 40
          exit
        end

        is_duplicate.unshift(@shisa_input)
        if is_duplicate.count - is_duplicate.uniq.count > 0
          puts "すでに回答済です。"
          sleep 1.0
          puts "あなたの勝ちです！"
          puts "=" * 40
          exit
        end

      end
    rescue Timeout::Error
      puts "ターイムアウト!"
      sleep 1.0
      puts "あなたの勝ちです！"
      puts "=" * 40
      $!
      exit
    end
  end
end
