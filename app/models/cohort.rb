# == Schema Information
#
# Table name: cohorts
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  year              :string(255)
#  start_date        :date
#  phase_id          :integer
#  current_phase_day :string(255)
#


class Cohort < ActiveRecord::Base
  attr_accessible :name, :year, :start_date, :phase_id, :phase, :current_phase_day
  has_many :users
  has_many :cohort_events
  has_many :cohorts, through: :cohort_events
  belongs_to :phase

  def current_phase_day
    phase_time = [week_at_dbc, day_in_week_at_dbc]
    if phase.number == 2
      phase_time[0] = phase_time.first - 3
    elsif phase.number == 3
      phase_time[0] = phase_time.first - 6
    end
    phase_time
  end

  def expired?
     self.start_date.to_i === self.start_date.to_i + 63 if  self.start_date
  end

  def days_at_dbc
    (Time.now.localtime.to_date - self.start_date.to_date + 1).to_i if self.start_date
  end

  def week_at_dbc
    ((days_at_dbc / 7) + 1).to_i if  self.start_date
  end

  def day_in_week_at_dbc
    (days_at_dbc % 7).to_i if  self.start_date
  end
end
