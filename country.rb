class Country
  COUNTRIES = File.read("./country.txt").split

  def initialize
    @is_duplicate = []
  end

  def begin
    country = COUNTRIES.sample
    @is_duplicate << country
    country
  end

  def last_char
    @is_duplicate.last.delete('ー-').tr('ァィゥェォッャュョヮ', 'アイウエオツヤユヨワ')[-1]
  end

  def choose
    countries = COUNTRIES.select { |c| c[0] == last_char }
    country = countries.sample
    puts "頭に浮かばないさぁ〜、降参するさぁ〜" if country.nil?
    @is_duplicate << country
    country
  end

  def insert(input)
    @is_duplicate << input
  end

  def confirm(input)
    match = COUNTRIES.find { |c| c == input }
    unless match
      puts "そのような国名はありません。"
      puts "正しい国名を入力してください。"
      puts "=" * 40
    end
    match
  end

  def word_end?(input)
    last_char = input[-1] == "ン"
    if last_char
      puts "語尾が「ン」で終わっています。"
      sleep 1.0
      true
    else
      false
    end
  end

  def duplicate?
    duplication = @is_duplicate.count - @is_duplicate.uniq.count > 0
    if duplication
      puts "すでに回答済です。"
      sleep 1.0
      true
    else
      false
    end
  end
end
