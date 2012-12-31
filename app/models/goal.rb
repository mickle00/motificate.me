class Goal < ActiveRecord::Base
  attr_accessible :frequency, :name
  has_many :logs

  def number_of_logs
    self.logs.size
  end
  def recent_logs
    self.logs.order('activity_date desc').limit(5)
    # Log.where
  end
end
