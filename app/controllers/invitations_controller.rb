class InvitationsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_name(params[:invitation][:username])
    if @user 
      @event = Event.find_by_description(params[:event_description])
      @event_attendance = @event.event_attendances.build(attendee_id: @user.id)
      @event_attendance.save
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end
end
