# == Schema Information
#
# Table name: cohorts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  year       :string(255)
#  start_date :string(255)
#  phase_id   :integer
#

class Cohort < ActiveRecord::Base
  attr_accessible :name, :year, :start_date, :phase_id
  has_many :users
  belongs_to :phase
end
