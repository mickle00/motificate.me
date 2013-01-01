class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def show
    @log = Log.find(params[:id])
  end

  def new
    @log = Log.new
    @log['goal_id'] = params[:goal]
  end

  def edit
    @log = Log.find(params[:id])
  end

  def create
    @log = Goal.find(params[:log][:goal]).logs.build(description: params[:log][:description],
                                                      activity_date: Date.today)
  end

  def update
    @log = Log.find(params[:id])
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy
  end
end
