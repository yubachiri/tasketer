class WorkSpace < ApplicationRecord
  belongs_to :user
  has_many :tasks
  # has_one :segment_title
  has_one :custom_title

  validates :name, presence: true

  scope :active, -> { where(archived: false) }
  scope :archived, -> { where(archived: true) }
  scope :owned_by, -> (user) { active.where(user: user) }


  def archive!
    update!(archived: true)
  end

  def owned_by?(user)
    self.user == user
  end


end
