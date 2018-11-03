class SegmentTitlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @work_spaces = current_user.work_spaces
    @default_title = current_user.default_title || DefaultTitle.new(user: current_user)
  end

  def create
    new_segment_title = SegmentTitle.new(segment_title_params)
    if new_segment_title.save
      redirect_to segment_titles_path, success: 'update succeeded!'
    else
      redirect_to segment_titles_path, alert: 'failed...'
    end
  end

  def update
    target_segment_title = SegmentTitle.find_by(id: params[:id])
    if target_segment_title.update(segment_title_params)
      redirect_to segment_titles_path, success: 'update succeeded!'
    else
      redirect_to segment_titles_path, alert: 'failed...'
    end
  end

  def segment_title_params
    key = (params.keys & %w(segment_title default_title custom_title))[0]
    params.require(key).permit(
      :seg_first,
      :seg_second,
      :seg_third,
      :seg_last,
      :type,
      :user_id,
      :work_space_id
    )
  end

end
