print "あなた:"
input = gets.chomp.to_s

countries = ["アメリカ", "ニホン", "アフリカ", "ドイツ"]
p shisa_select = countries.map { |country| country if country[0] == input[-1] }
p shisa_select.compact.sample
