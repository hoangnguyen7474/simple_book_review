class Book < ApplicationRecord
  resourcify
  searchkick

  belongs_to :user
  belongs_to :category
  
  has_many :comments, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  validates :photo, presence: true, content_type: [:png, :jpg, :jpeg]

  scope :by_category, -> (category_id) { where(category_id: category_id) }
  default_scope { order(title: :asc) }
end
