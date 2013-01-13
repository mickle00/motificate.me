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

class Log < ActiveRecord::Base
  belongs_to :user_goal
  attr_accessible :activity_date, :description

  def goal_name
   if self.goal
     self.goal.name
   else
     'No Name'
   end
  end

end
