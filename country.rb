class Country
  COUNTRIES = File.read("./country.txt").split

  def initialize
    @history_record = []
  end

  def choose_random
    COUNTRIES.sample
  end

  def insert_history_record(country)
    @history_record << country
  end

  def last_char
    @history_record.last.delete('ー-').tr('ァィゥェォッャュョヮ', 'アイウエオツヤユヨワ')[-1]
  end

  def choose_answer
    countries = COUNTRIES.select { |c| c[0] == last_char }
    country = countries.sample
    @history_record << country
    country
  end

  # def insert(selected_country)
  #   @history_record << choose_random
  #   @history_record << selected_country
  # end

  def confirm(selected_country)
    COUNTRIES.find { |c| c == selected_country }
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
    duplication = @history_record.count - @history_record.uniq.count > 0
    if duplication
      puts "すでに回答済です。"
      true
    else
      false
    end
  end
end
