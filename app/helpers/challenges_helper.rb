module ChallengesHelper
  # TODO-JW: Consider using Date::DAYNAMES
  def day_of_week_name(day_of_week)
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