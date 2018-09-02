class PagesController < ApplicationController
  def index
    if user_signed_in?
      @tasks = current_user.tasks
    end
  end
end
