class Countries
  def countries
    @countries = File.read("./country.txt").split
  end
end