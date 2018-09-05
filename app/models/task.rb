class Task < ApplicationRecord
  include RankedModel
  ranks :row_order, with_same: :user_id

  belongs_to :user

  validates :title, presence: true

  enum matrix_status: [top: 1,
                       next: 2,
                       not_important: 3,
                       other: 4]
end
