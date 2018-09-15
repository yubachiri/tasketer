class WorkSpacesController < ApplicationController
  def index
    @work_spaces = current_user.work_spaces
  end

  def show

  end

  def new
  end

  def create
    work_space = current_user.work_spaces.build(work_space_params)
    work_space.save
    redirect_to work_spaces_path
  end


  private

  def work_space_params
    params.require(:work_space).permit(:name)
  end
end
