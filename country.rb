class Country
  COUNTRIES = File.read("./country.txt").split

  def initialize
    @is_duplicate = []
  end

  def choose_random
    country = COUNTRIES.sample
    @is_duplicate << country
    country
  end

  def last_char
    @is_duplicate.last.delete('ー-').tr('ァィゥェォッャュョヮ', 'アイウエオツヤユヨワ')[-1]
  end

  def choose_answer
    countries = COUNTRIES.select { |c| c[0] == last_char }
    country = countries.sample
    @is_duplicate << country
    country
  end

  def insert(selected_country)
    @is_duplicate << selected_country
  end

  def confirm(selected_country)
    match = COUNTRIES.find { |c| c == selected_country }
    unless match
      puts "そのような国名はありません。"
      puts "正しい国名を入力してください。"
      puts "========================================"
    end
    match
  end

  def word_end?(selected_country)
    last_char = selected_country[-1] == "ン"
    if last_char
      puts "語尾が「ン」で終わっています。"
      true
    else
      false
    end
  end

  def duplicate?
    duplication = @is_duplicate.count - @is_duplicate.uniq.count > 0
    if duplication
      puts "すでに回答済です。"
      true
    else
      false
    end
  end
end
