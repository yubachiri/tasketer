module WorkSpacesHelper
  def item_count(work_space, status)
    work_space.tasks.where(type: Task.matrix_statuses[status], archived: false).count
  end
end
