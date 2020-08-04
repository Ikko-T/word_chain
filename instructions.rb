class Instruction
  def greet
    messages.each do |message|
      puts message
      sleep 1.5
    end
    sleep 1.5
  end

  private

  def messages
    speech = [
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
  end

  def favorite_message
    favorite_food = ["ゴーヤー", "サーターアンダギー", "ソーキそば", "フーチャンプルー", "ちんすこう"].sample
    <<~TEXT
    好きな食べ物は#{favorite_food}です。
    #{"-" * 40}
    TEXT
  end

  def shisa_start
    <<~TEXT
    #{"-" * 40}
    それでは、わたくしシーサーから始めます！
    #{"=" * 40}
    TEXT
  end
end
