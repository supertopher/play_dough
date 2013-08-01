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

require 'spec_helper'

describe Cohort do
  it { should have_many(:users)}
  it { should belong_to(:phase)}
end
