

class Cohort < ActiveRecord::Base
  attr_accessible :name, :year, :start_date, :phase_id
  has_many :users
  belongs_to :phase

  def current_phase_day
   	[week_at_dbc, day_in_week_at_dbc] 
  end  

  def expired?
     self.start_date === self.start_date + 63
  end

  def days_at_dbc
  	(Time.zone.now.to_date - self.start_date.to_date).to_i
  end
  
  def week_at_dbc
    ((days_at_dbc / 7) + 1).to_i
  end

  def day_in_week_at_dbc
  	(days_at_dbc % 7).to_i
  end
end
