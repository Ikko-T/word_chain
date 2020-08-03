class Instruction
  def greet
    messages = [
      "めんそ〜れ〜",
      "しりとり名人の「シーサー・ゴヤ」と申します。",
      "",
      "それはさておき、しりとりゲームの説明をします。",
      "世界国名しりとりです。",
      "ルールは、",
      "カタカナ入力です。",
      "語尾が「ン」で終った場合、",
      "同じ国名を二度繰り返した場合、",
      "または制限時間20秒を過ぎたら負けです。",
      ""
    ]
    messages.each_with_index do |message, i|
      case i
      when 0, 1, 3, 4, 5, 6, 7, 8, 9
        puts message
        sleep 1.5
      when 2
        favorite_food = ["ゴーヤー", "サーターアンダギー", "ソーキそば", "フーチャンプルー", "ちんすこう"].sample
        puts "好きな食べ物は#{favorite_food}です。"
        puts "-" * 40
      else 10
        puts "-" * 40
        puts "それでは、わたくしシーサーから始めます！"
        puts "=" * 40
        sleep 3.0
      end
    end
  end
end
