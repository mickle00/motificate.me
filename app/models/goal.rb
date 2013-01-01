class Goal < ActiveRecord::Base
  attr_accessible :frequency, :name
  has_many :logs

  def number_of_logs
    self.logs.size
  end
  def recent_logs
    self.logs.where('activity_date >= ?', 1.week.ago).order('activity_date desc').limit(5)
    # Log.where
  end
end
