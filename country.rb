class Country
  COUNTRIES = File.read("./country.txt").split

  class << self
    def random
      COUNTRIES.sample
    end

    def last_char(country)
      country.delete('ー-').tr('ァィゥェォッャュョヮ', 'アイウエオツヤユヨワ')[-1]
    end

    def grab_on_behind(country)
      country_last_letter = last_char(country)
      countries = COUNTRIES.select { |c| c[0] == country_last_letter }
      countries.sample
    end

    def equal(country)
      COUNTRIES.any? { |c| c == country }
    end

    def duplicate(countries)
      countries.count - countries.uniq.count > 0
    end
  end
end
