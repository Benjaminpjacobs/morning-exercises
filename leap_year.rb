class LeapYears
  def leap?(year)
    year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)
  end

  def collect_years(current_year, number_of_leaps)
    leap_years = [] 
    year = current_year
    until leap_years.length == number_of_leaps
      leap_years << year if leap?(year)
      year += 1
    end
    p leap_years
  end
end

leap_collector = LeapYears.new
leap_collector.collect_years(2017, 25)
