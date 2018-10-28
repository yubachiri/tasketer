class SegmentTitle < ApplicationRecord
  belongs_to :work_space, required: false
  belongs_to :user, required: false

  enum segment: [:seg_first,
                 :seg_second,
                 :seg_third,
                 :seg_last]

  def title_of(type)
    case type
    when SegmentTitle.segments[:seg_first]
      return self.seg_first if self.seg_first.present?
    when SegmentTitle.segments[:seg_second]
      return self.seg_second if self.seg_second.present?
    when SegmentTitle.segments[:seg_third]
      return self.seg_third if self.seg_third.present?
    when SegmentTitle.segments[:seg_last]
      return self.seg_last if self.seg_last.present?
    end
  end

end
