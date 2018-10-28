class WorkSpace < ApplicationRecord
  belongs_to :user
  has_many :tasks
  # has_one :segment_title
  has_one :custom_title

  validates :name, presence: true

end
