module EventsHelper
  def format_date(datetime)
    datetime.strftime('%A, %B %d at %I:%M %p')
  end

  def going?(event)
    if logged_in?
      event.attendees.include?(current_user) ? true : false
    else
      false
    end
  end
end
