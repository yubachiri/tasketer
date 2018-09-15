class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @top_tasks = TopTask.task_index(current_user).rank(:row_order)
    @next_tasks = NextTask.task_index(current_user).rank(:row_order)
    @not_important_tasks = NotImportantTask.task_index(current_user).rank(:row_order)
    @other_tasks = OtherTask.task_index(current_user).rank(:row_order)
  end

  def create
    task = current_user.tasks.new(task_params)
    if task.save
      redirect_to tasks_path, notice: 'succeeded!'
    else
      redirect_to tasks_path, alert: 'failed...'
    end
  end

  def update
    task = Task.find_by(id: params[:id])
    task.update(task_params)
    # TODO: ビューへの反映
    render nothing: true
  end

  def destroy
    task = current_user.tasks.find_by(id: params[:id])
    if task.update!(archived: true)
      redirect_to tasks_path, notice: 'archived!'
    else
      redirect_to tasks_path, alert: 'archive failed...'
    end
  end


  def sort
    task = current_user.tasks.find_by(id: params[:task_id])
    task.update!(task_params)
    render nothing: true
  end

  private

  def task_params
    key = (params.keys & %w(task top_task next_task not_important_task other_task))[0]
    params.require(key).permit(
      :title,
      :description,
      :type,
      :row_order_position
    )
  end
end
