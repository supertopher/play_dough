class Cohort < ActiveRecord::Base
  attr_accessible :name, :year, :start_date
  has_many :users
end
