# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  frequency  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  count      :integer
#

require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
