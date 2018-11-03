module SegmentTitlesHelper
  def segment_label(work_space, user, segment_type)
    work_space&.custom_title&.title_of(segment_type) || user.default_title&.title_of(segment_type) || ServiceDefaultTitle.first.title_of(segment_type)
    # render 'shared/segment_label', work_space: work_space, user: user, segment_type: segment_type
  end
end
