# require_relative "instructions"
require_relative "word_chain"
require_relative "shisa"
require_relative "user"
require_relative "countries"
require 'timeout'
require 'pry'

word_chain = WordChain.new
user = User.new
shisa = Shisa.new
country = Country.new
word_chain.game_start(user, shisa)