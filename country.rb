class Country
  COUNTRIES = File.read("./country.txt").split

  def initialize    
    @is_duplicate = []
  end

  def choice
    country = COUNTRIES.sample
    @is_duplicate << country
    country
  end

  def a_choice(first_char)
    country = COUNTRIES.select { |c| c[0] == first_char }
    @is_duplicate << country
    country
  end

  def duplicate?
    @is_duplicate.count - @is_duplicate.uniq.count > 0
  end
end