module ChallengesHelper
  def return_day(day_of_week)
    # monday == 1, tuesday == 2
    day_array = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ]
    day_array[(day_of_week-1)]
  end
end