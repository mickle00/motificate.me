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

class Goal < ActiveRecord::Base
  attr_accessible :frequency, :name, :count
  has_many :user_goals
  has_many :logs, :through => :user_goals
  has_many :users, :through => :user_goals

end
