class PagesController < ApplicationController
  def index
    if user_signed_in?
      @tasks = current_user.tasks.rank(:row_order)
    end
  end
end
