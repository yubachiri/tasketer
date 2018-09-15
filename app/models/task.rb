class Task < ApplicationRecord
  include RankedModel
  ranks :row_order, with_same: :work_space_id

  belongs_to :work_space
  delegate :user, to: :work_space

  validates :title, presence: true
  validates :type, presence: true

  scope :task_index, -> (work_space) do
    where(archived: false, work_space: work_space)
  end

  enum matrix_status: [top: 1,
                       next: 2,
                       not_important: 3,
                       other: 4]
end
