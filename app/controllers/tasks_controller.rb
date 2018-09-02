class TasksController < ApplicationController
  def create
    task = current_user.tasks.new(task_params)
    if task.save
      redirect_to root_path, notice: 'succeeded!'
    else
      redirect_to root_path, alert: 'failed...'
    end
  end

  def destroy
    task = current_user.tasks.find_by(id: params[:id])
    if task.destroy
      redirect_to root_path, notice: 'delete succeeded!'
    else
      redirect_to root_path, alert: 'delete failed...'
    end
  end


  def sort
    task = current_user.tasks.find_by(id: params[:task_id])
    task.update(task_params)
    render nothing: true
  end

  private

  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :type,
      :row_order_position
    )
  end
end
