class Book < ApplicationRecord
  resourcify

  belongs_to :user
  belongs_to :category
  
  has_many :comments, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  validates :photo, presence: true, content_type: [:png, :jpg, :jpeg]

  scope :book_all, -> { order(title: :asc) }
  scope :by_category, -> (category_id) { where(category_id: category_id) }
end
