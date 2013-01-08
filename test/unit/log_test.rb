# == Schema Information
#
# Table name: logs
#
#  id            :integer          not null, primary key
#  goal_id       :integer
#  description   :text
#  activity_date :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class LogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
