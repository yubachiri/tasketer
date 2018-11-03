class WorkSpacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @work_spaces = current_user.work_spaces
  end

  def create
    work_space = current_user.work_spaces.build(work_space_params)
    work_space.save
    redirect_to work_spaces_path
  end

  def update
    work_space = WorkSpace.find_by(id: params[:id])
    if work_space.update(work_space_params)
      redirect_to work_spaces_path, notice: 'update succeeded!'
    else
      redirect_to work_spaces_path, alert: 'failed...'
    end
  end

  def destroy

  end


  private

  def work_space_params
    params.require(:work_space).permit(:name)
  end
end
