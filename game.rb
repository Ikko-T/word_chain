require 'timeout'
require 'nkf'
require 'pry'
require_relative "instructions"
require_relative "word_chain"
require_relative "shisa"
require_relative "user"
require_relative "country"

word_chain = WordChain.new
shisa = Shisa.new
user = User.new
word_chain.game_start(shisa, user)
