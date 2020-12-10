class Country
  COUNTRIES = File.read("./country.txt").split

  def self.choose_random
    COUNTRIES.sample
  end

  def self.insert_history_record(country)
    @history_record << country
  end

  def self.last_char
    @history_record.last.delete('ー-').tr('ァィゥェォッャュョヮ', 'アイウエオツヤユヨワ')[-1]
  end

  def self.choose_answer
    countries = COUNTRIES.select { |c| c[0] == last_char }
    countries.sample
  end

  def self.search_same(country)
    COUNTRIES.find { |c| c == country }
  end

  def self.last_letter_fail?(selected_country)
    selected_country[-1] == "ン"
  end

  def self.duplicate?
    @history_record.count - @history_record.uniq.count > 0
  end
end
