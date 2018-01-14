class EventsController < ApplicationController
  before_action :require_login, only: %i[attend, unattend]

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
    if logged_in?
      @going = @event.attendees.include?(current_user) ? true : false
    end
  end

  def index
    @upcoming = Event.upcoming
    @past = Event.past
  end

  def attend
    if !(event = Event.find(params[:id]))
      flash[:danger] = "Invalid event."
      redirect_to events_path
    elsif event.attendees.include?(current_user)
      flash[:warning] = "You're already going to #{event.name}!"
      redirect_to event
    else
      event.attendees << current_user
      flash[:success] = "You're going to #{event.name}!"
      redirect_to event
    end
  end

  def unattend
    if !(event = Event.find(params[:id]))
      flash[:danger] = "Invalid event."
      redirect_to events_path
    elsif !event.attendees.include?(current_user)
      flash[:warning] = "You're already not going to #{event.name}!"
      redirect_to event
    else
      event.attendees.destroy(current_user)
      flash[:success] = "You're no longer going to #{event.name}."
      redirect_to event
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :datetime)
  end

  def require_login
    unless logged_in? 
      flash[:danger] = 'You need to login to do that.'
      redirect_to login_path
    end
  end
end
