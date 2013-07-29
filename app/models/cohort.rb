# == Schema Information
#
# Table name: cohorts
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  year              :string(255)
#  start_date        :string(255)
#  phase_id          :integer
#  current_phase_day :string(255)
#

class Cohort < ActiveRecord::Base
  attr_accessible :name, :year, :start_date, :phase_id, :current_phase_day
  has_many :users
  belongs_to :phase
  has_many :cohort_events
  has_many :cohorts, through: :cohort_events
end
