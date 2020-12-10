class WordChain
  def initialize
    @count = 0
    @history_record = []
  end

  def game_start(shisa, user)
    # shisa.greet
    loop do
      @count += 1
      batting(@count, shisa)
      fielding(user)
    end
  end
end
