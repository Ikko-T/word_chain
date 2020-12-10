class WordChain
  def initialize
    @count = 0
    @history_record = []
  end

  def game_start(shisa, user)
    # shisa.greet
    loop do
      @count += 1
      shisa.action(@count, country)
      user.action(country)
    end
  end
end
