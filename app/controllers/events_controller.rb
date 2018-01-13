class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @upcoming = Event.upcoming
    @past = Event.past
  end

  def add
    if logged_in? && (event = Event.find(params[:id]))
      event.attendees << current_user
      flash[:success] = "You're going to #{event.name}!"
      redirect_to event
    else
      flash[:danger] = 'You need to login before adding events.'
      redirect_to login_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :datetime)
  end
end
