class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
    @upcoming_events = @user.attended_events.upcoming.all
    @previous_events = @user.attended_events.previous.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name)
    end

end
