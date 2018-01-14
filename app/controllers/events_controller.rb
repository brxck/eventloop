class EventsController < ApplicationController
  before_action :require_login, only: %i[attend, unattend, destroy]

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

  def destroy
    if !(event = Event.find_by(params[:id]))
      flash[:danger] = "Event not found."
      redirect_to events_path
    elsif !helpers.hosting?(event)
      flash[:danger] = "You can't delete an event you're not hosting."
      redirect_to event
    else
      event.destroy
      flash[:success] = "Event deleted."
      redirect_to current_user
    end
  end

  def attend
    if !(event = Event.find(params[:id]))
      flash[:danger] = "Invalid event."
      redirect_to events_path
    elsif helpers.going?(event)
      flash[:warning] = "You're already going to #{event.name}!"
      redirect_to event
    elsif helpers.hosting?(event)
      flash[:warning] = "You're already hosting #{event.name}."
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
    elsif !helpers.going?(event)
      flash[:warning] = "You're already not going to #{event.name}!"
      redirect_to event
    elsif helpers.hosting?(event)
      flash[:warning] = "You're already hosting #{event.name}."
      redirect_to event
    else
      event.attendees.destroy(current_user)
      flash[:success] = "You're no longer going to #{event.name}."
      redirect_to event
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :datetime, :description)
  end

  def require_login
    unless logged_in? 
      flash[:danger] = 'You need to login to do that.'
      redirect_to login_path
    end
  end
end
