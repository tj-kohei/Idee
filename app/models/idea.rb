class Idea < ApplicationRecord

  belongs_to :user
  has_many :reviews, dependent: :delete_all

  mount_uploader :figure, FigureUploader

  validates :title, presence: true
  validates :category, presence: true
  validates :detail, presence: true

  enum category:{web: 1, mobile: 2, desk_top: 3}

  
end
