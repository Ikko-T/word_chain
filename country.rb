class Country
  class << self
    COUNTRIES = File.read("./country.txt").split

    def choose_random
      COUNTRIES.sample
    end

    def insert_history_record(country)
      @history_record << country
    end

    def last_char
      @history_record.last.delete('ー-').tr('ァィゥェォッャュョヮ', 'アイウエオツヤユヨワ')[-1]
    end

    def choose_intentional
      countries = COUNTRIES.select { |c| c[0] == last_char }
      countries.sample
    end

    def search_same(country)
      COUNTRIES.find { |c| c == country }
    end

    def last_letter_fail?(country)
      country[-1] == "ン"
    end

    def duplicate?
      @history_record.count - @history_record.uniq.count > 0
    end
  end
end
