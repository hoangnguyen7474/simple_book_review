class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  resourcify
  has_many :comments, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  validates :photo, presence: true, content_type: [:png, :jpg, :jpeg]
end
