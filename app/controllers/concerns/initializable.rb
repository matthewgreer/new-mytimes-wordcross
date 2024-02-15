module Initializable
  extend ActiveSupport::Concern

  # default to the current date in the user's timezone, or "America/New_York" if timezone is not yet recorded in the db
  def wordcross_date_from_timezone(timezone: "America/New_York")
    tz = ActiveSupport::TimeZone[timezone]

    tz.today.to_formatted_s(:db)
  end

  # creates a blank, unsolved puzzle grid from the solution
  def init_grid_state(solution)
    solution.map do |row|
      row.map { |square| square == "#" ? "#" : "" }
    end
  end
end
