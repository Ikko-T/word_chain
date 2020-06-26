# 10.downto(0) do |countdown|
#       print countdown, ","
#       sleep 1.0
#       break if gets.chomp != nil
# end

# input = gets
# countdown = 10
# while countdown > 0
#     countdown -= 1
#     print countdown, ","
#     sleep 1
#     break if input.empty?
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

catch :done do
    10.downto(0) do |countdown|
        print countdown, ","
        sleep 1.0
        if gets != ""
            throw :done
        end
    end
end