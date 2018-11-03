class WorkSpacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_work_space, only: [:update, :destroy]

  def index
    @work_spaces = WorkSpace.owned_by(current_user)
  end

  def create
    work_space = current_user.work_spaces.build(work_space_params)
    work_space.save
    redirect_to work_spaces_path
  end

  def update
    if @work_space.update(work_space_params)
      redirect_to work_spaces_path, notice: 'update succeeded!'
    else
      redirect_to work_spaces_path, alert: 'failed...'
    end
  end

  def destroy
    if @work_space.archive!
      redirect_to work_spaces_path, notice: 'work space archived!'
    else
      redirect_to work_spaces_path, notice: 'archive failed...'
    end
  end


  private

  def work_space_params
    params.require(:work_space).permit(:name)
  end

  def set_work_space
    @work_space = WorkSpace.find_by(id: params[:id])
  end
end
