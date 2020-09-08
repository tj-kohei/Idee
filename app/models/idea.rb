class Idea < ApplicationRecord

  belongs_to :user
  has_many :reviews, dependent: :delete_all

  
end
