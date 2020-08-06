require 'timeout'
require 'nkf'
require 'pry'
require_relative "instructions"
require_relative "word_chain"
require_relative "shisa"
require_relative "user"
require_relative "country"

word_chain = WordChain.new
instruction = Instruction.new
user = User.new
shisa = Shisa.new
country = Country.new
word_chain.game_start(instruction, shisa, user)
