# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  challenge_id :integer
#  karma        :integer          default(0)
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Comment do
  it { should belong_to(:user)}
  it { should belong_to(:challenge)}
end
