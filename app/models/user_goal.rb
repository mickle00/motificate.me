class UserGoal < ActiveRecord::Base
  belongs_to :user
  belongs_to :goal
  has_many :logs
  attr_accessible :active, :private, :goal

  validates :user, presence: true
  validates :goal, presence: true
  validates_uniqueness_of :goal_id, :scope => :user_id

  def recent_logs
    self.logs.where('activity_date >= ?', 1.week.ago).order('activity_date desc')
  end

end
