class Task < ApplicationRecord
  include RankedModel
  ranks :row_order, with_same: :work_space_id, scope: :active

  belongs_to :work_space
  delegate :user, to: :work_space

  validates :title, presence: true
  validates :type, presence: true

  scope :task_index, -> (work_space) { active.where(work_space: work_space) }
  scope :active, -> { where(archived: false) }
  scope :archived, -> { where(archived: true) }

  enum matrix_status: { top: 'TopTask', next: 'NextTask', not_important: 'NotImportantTask', other: 'OtherTask' }


  def archive!
    update!(archived: true)
  end
end
