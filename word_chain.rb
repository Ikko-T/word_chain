class WordChain
  def initialize
    @count = 0
  end

  def game_start(user, shisa)
    country = Country.new 
    # shisa.greet
    loop do
      shisa.action(@count, country)
      user.action(country)
      @count += 1
    end

    # シーサーの登場
    # loop do
    #   shisa.turn(しりとりの頭文字)
    #   break if ~~~
    #   user.turn(しりとりの頭文字)
    #   break if ~~~
    # end
    # ゲーム終了
  end
end