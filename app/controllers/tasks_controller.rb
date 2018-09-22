class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_own_work_space
  before_action :set_work_space

  def index
    @top_tasks = TopTask.task_index(@work_space).rank(:row_order)
    @next_tasks = NextTask.task_index(@work_space).rank(:row_order)
    @not_important_tasks = NotImportantTask.task_index(@work_space).rank(:row_order)
    @other_tasks = OtherTask.task_index(@work_space).rank(:row_order)
  end

  def create
    task = @work_space.tasks.new(task_params)
    if task.save
      flash[:success] = 'succeeded!'
      redirect_to work_space_tasks_path(@work_space)
    else
      flash[:error] = 'failed...'
      redirect_to work_space_tasks_path(@work_space)
    end
  end

  def update
    task = Task.find_by(id: params[:id])
    task.update(task_params)
    # TODO: ビューへの反映
    render nothing: true
  end

  def destroy
    task = @work_space.tasks.find_by(id: params[:id])
    if task&.update!(archived: true)
      flash[:success] = 'archived!'
      redirect_to work_space_tasks_path(@work_space)
    else
      flash[:error] = 'archive failed...'
      redirect_to work_space_tasks_path(@work_space)
    end
  end

  def sort
    task = @work_space.tasks.find_by(id: params[:task_id])
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

  def check_own_work_space
    ws = WorkSpace.find_by(id: params[:work_space_id])
    if ws.user != current_user
      flash[:error] = "エラーが発生しました。"
      redirect_to work_spaces_path
    end
  end

  def set_work_space
    @work_space = current_user.work_spaces.find_by(id: params[:work_space_id])
  end

end
