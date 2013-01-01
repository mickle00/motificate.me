class Log < ActiveRecord::Base
  belongs_to :goal
  attr_accessible :activity_date, :description

  def goal_name
   if self.goal
     self.goal.name
   else
     'No Name'
   end
  end

end
