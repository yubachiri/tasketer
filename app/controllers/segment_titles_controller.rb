class SegmentTitlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @work_spaces = current_user.work_spaces
  end
end
