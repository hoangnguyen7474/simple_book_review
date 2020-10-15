class Book < ApplicationRecord
  resourcify

  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  # validates :photo, presence: true, content_type: [:png, :jpg, :jpeg]

  scope :by_category, -> (id) { where(category_id: id) }

  default_scope { order(title: :asc) }
end
