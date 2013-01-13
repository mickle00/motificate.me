module GoalsHelper
  def subscribed?(goal)
    goal.user_goals.where(:user_id => current_user).size > 0
  end

  def user_goal_id(goal)
    goal.user_goals.where(:user_id => current_user).first
  end

  def user_logs(goal)
    current_user.user_goals.where(:goal_id => goal.id).first.logs
  end
end
