class ArchivedTasksController < ApplicationController
  def index
    @archived_tasks = current_user.tasks.where(archived: true)
  end
end
