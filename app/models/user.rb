class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :work_spaces
  # カスタムデフォルトタイトル
  # has_one :segment_title
  has_one :default_title
end
