class Instruction
  def greet
    messages = [
      "めんそ〜れ〜",
      "しりとり名人の「シーサー・ゴヤ」と申します。"
    ]

    messages.each do |message|
      puts message
      sleep 1.5
    end

    puts "めんそ〜れ〜"
    sleep 1.5
    puts "しりとり名人の「シーサー・ゴヤ」と申します。"
    sleep 1.5
    favorite_food = ["ゴーヤー", "サーターアンダギー", "ソーキそば", "フーチャンプルー", "ちんすこう"].sample
    puts "好きな食べ物は#{favorite_food}です。"
    puts "-" * 40
      sleep 1.5
    puts "それはさておき、しりとりゲームの説明をします。"
    puts "-" * 40
    sleep 1.5
    puts "世界国名しりとりです。"
    sleep 1.5
    puts "ルールは、"
    sleep 1.5
    puts "カタカナ入力です。"
    sleep 1.5
    puts "語尾が「ン」で終った場合、"
    sleep 1.5
    puts "同じ国名を二度繰り返した場合、"
    sleep 1.5
    puts "または制限時間20秒を過ぎたら負けです。"
    puts "-" * 40
    sleep 1.5
    puts "それでは、わたくしシーサーから始めます！"
    puts "-" * 40
    sleep 3.0
  end
end
