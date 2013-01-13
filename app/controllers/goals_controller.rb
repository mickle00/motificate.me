class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def show
    @goal = Goal.find(params[:id])
    @recent_logs = @goal.logs.where('activity_date >= ?', 1.week.ago).order('activity_date desc')
  end

  def new
    @goal = Goal.new
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def create
    @goal = Goal.new(params[:goal])
    if @goal.save
      redirect_to @goal, notice: 'Goal was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(params[:goal])
     redirect_to @goal, notice: 'Goal was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
      redirect_to goals_url
  end
end
