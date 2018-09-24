class WorkSpace < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :segment_titles

  validates :name, presence: true

  def segment_model(segment_type)
    SegmentTitle.get_title(self, segment_type)
  end
end
