class Log < ActiveRecord::Base
  belongs_to :goal
  attr_accessible :activity_date, :description
end
