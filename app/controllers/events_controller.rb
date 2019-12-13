class EventsController < ApplicationController

  def index
    @upcoming_events = Event.upcoming.all
    @previous_events = Event.previous.all
  end

  def show
    @event = Event.find(params[:id])
    @creator = @event.creator
    @event_attendances = @event.event_attendances
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
        redirect_to @event
    else
      render 'new'
    end
  end

  private

    def event_params
      params.require(:event).permit(:description, :date)
    end
end
