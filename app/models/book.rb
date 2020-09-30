class Book < ApplicationRecord
  belongs_to :user
  resourcify
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  validates :image, content_type: [:png, :jpg, :jpeg]
 
end
