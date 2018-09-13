class Task < ApplicationRecord
  include RankedModel
  ranks :row_order, with_same: :user_id

  belongs_to :user

  validates :title, presence: true

  scope :task_index, -> (user) do
    where(archived: false, user: user)
  end

  enum matrix_status: [top: 1,
                       next: 2,
                       not_important: 3,
                       other: 4]
end
