require 'timeout'

Timeout.timeout(10.0) {|lim| "Time limit = #{lim}" }

begin
  Timeout.timeout(10.0) do
    gets.chomp
  end
rescue
  puts "ターイムアウト!!"
end

# require 'timers'

# timers = Timers::Group.new
# timer = timers.after(5)
# puts "Start"
# timers.wait
# puts "Fin"

# timers = Timers::Group.new
# timer = timers.every(5) {puts "every"}

# loop do
#   interval = timers.wait_interval
#   inputs = gets.chomp
#   if inputs.empty?
#     timers.fire
#   else
#     puts inputs
#   end
# end

# input = gets
# countdown = 10
# while countdown > 0
#     countdown -= 1
#     print countdown, ","
#     sleep 1
#     break if input.empty?
# end

# 10.downto(0) do |countdown|
#       print countdown, ","
#       sleep 1.0
# end

# i = 10
# while gets
#     break if gets != nil
#         while i > 0
#             i -= 1
#             puts(i+1)
#             next if input
#         end
# end

# catch :done do
#     10.downto(0) do |countdown|
#         print countdown, ","
#         sleep 1.0
#         if gets != ""
#             throw :done
#         end
#     end
# end