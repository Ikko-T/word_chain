#重複があるかの確認処理
country = gets.to_s.chomp
countries = ["アメリカ", "カナダ", "ニホン"]
countries.unshift(country)
if countries.count - countries.uniq.count > 0
  puts "回答済です。それゆえあなたの負けです。"
  puts "ゲーム終了！"
  countries.shift
end