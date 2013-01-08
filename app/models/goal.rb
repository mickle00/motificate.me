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
  has_many :logs

  def last_7_days_logs
    self.logs.where('activity_date >= ?', 1.week.ago).order('activity_date desc').limit(5)
  end

  def percent_goal_completed
    if self.weekly_frequency == nil
      return 0
    end
    completed = self.last_7_days_logs.size || 0
    (completed.to_f / self.weekly_frequency) * 100
  end

  def weekly_frequency
    if self.frequency == 'Daily'
      weekly_frequency = self.count * 7
    else
      weekly_frequency = self.count
    end
    weekly_frequency
  end
end
