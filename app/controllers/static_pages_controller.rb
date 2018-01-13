class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @upcoming_count = current_user.events.upcoming.count
    end
  end
end
