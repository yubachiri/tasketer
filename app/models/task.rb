class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  include RankedModel
  ranks :row_order
end
