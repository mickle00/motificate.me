class UserGoalsController < ApplicationController
  def index
    @user_goals = UserGoal.all
  end

  def show
    @user_goal = current_user.user_goals.find(params[:id])
    @logs = @user_goal.logs
  end

  def new
    @user_goal = UserGoal.new
    @user_goal['active'] = true
    @user_goal['goal_id'] = params[:goal_id]
  end

  def edit
    @user_goal = UserGoal.find(params[:id])
  end

  def create
    @goal = Goal.find(params[:user_goal][:goal_id])
    @private = params[:user_goal][:private]
    @active = params[:user_goal][:active]

    @user_goal = current_user.user_goals.build({ :goal => @goal,
                                                 :private => @private,
                                                 :active => @active})

    respond_to do |format|
      if @user_goal.save
        format.html { redirect_to @user_goal, notice: 'User goal was successfully created.' }
        format.json { render json: @user_goal, status: :created, location: @user_goal }
      else
        format.html { render action: "new" }
        format.json { render json: @user_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user_goal = UserGoal.find(params[:id])

    respond_to do |format|
      if @user_goal.update_attributes(params[:user_goal])
        format.html { redirect_to @user_goal, notice: 'User goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_goal = UserGoal.find(params[:id])
    @user_goal.destroy

    respond_to do |format|
      format.html { redirect_to user_goals_url }
      format.json { head :no_content }
    end
  end
end
