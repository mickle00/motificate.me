class GoalsByWeek
  attr_reader :goal
  REPORT_PERIOD = 6.months.ago

  def initialize(goal)
    @goal = goal
  end

  def weekly_logs
    @goal.logs.where('activity_date >= ?', REPORT_PERIOD)
      .group_by{ |log| log.activity_date.beginning_of_week }
  end
end
