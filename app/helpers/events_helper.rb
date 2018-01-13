module EventsHelper
  def format_date(datetime)
    datetime.strftime('%A, %B %d at %I:%M %p')
  end
end
