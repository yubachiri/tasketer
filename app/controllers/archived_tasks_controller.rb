class ArchivedTasksController < ApplicationController
  def index
    @archived_tasks = Task.joins(:work_space).merge(WorkSpace.where(user: current_user)).where(archived: true)
  end
end
