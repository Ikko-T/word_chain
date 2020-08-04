class Instruction
  def greet
    favorite_food = ["ゴーヤー", "サーターアンダギー", "ソーキそば", "フーチャンプルー", "ちんすこう"].sample
    favorite_message = <<~TEXT
    好きな食べ物は#{favorite_food}です。
    #{"-" * 40}
    TEXT
    shisa_start = <<~TEXT
    #{"-" * 40}
    それでは、わたくしシーサーから始めます！
    #{"=" * 40}
    TEXT

    messages = [
      "めんそ〜れ〜",
      "しりとり名人の「シーサー・ゴヤ」と申します。",
      favorite_message,
      "それはさておき、しりとりゲームの説明をします。",
      "世界国名しりとりです。",
      "ルールは、",
      "カタカナ入力です。",
      "語尾が「ン」で終った場合、",
      "同じ国名を二度繰り返した場合、",
      "または制限時間20秒を過ぎたら負けです。",
      shisa_start
    ]

    messages.each do |message|
      puts message
      sleep 1.5
    end
    sleep 1.5
  end
end
