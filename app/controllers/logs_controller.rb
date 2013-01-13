class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def show
    @log = Log.find(params[:id])
  end

  def new
    @log = Log.new
    @log['user_goal'] = UserGoal.find(params[:user_goal_id])
    @log['user_goal_id'] = params[:user_goal_id]
  end

  def edit
    @log = Log.find(params[:id])
  end

  def create
    @log = UserGoal.find(params[:log][:user_goal_id]).logs.build(description: params[:log][:description],
                                                               activity_date: Date.today)
    @log.save
    redirect_to user_goal_path(@log.user_goal)
  end

  def update
    @log = Log.find(params[:id])
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy
  end
end
