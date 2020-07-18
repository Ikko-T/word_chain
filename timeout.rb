require 'timeout'

Timeout.timeout(10.0) {|lim| "Time limit = #{lim}" }

begin
  Timeout.timeout(10.0) do
    gets.chomp
  end
rescue Timeout::Error
  puts "ターイムアウト!!"
end
