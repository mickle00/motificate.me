class AddUserGoalIdToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :user_goal_id, :integer
  end
end
