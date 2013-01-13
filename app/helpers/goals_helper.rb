module GoalsHelper
  def subscribed?(goal)
    goal.user_goals.where(:user_id => current_user).size > 0
  end

  def user_goal_id(goal)
    goal.user_goals.where(:user_id => current_user).first
  end
end
