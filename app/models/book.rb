class Book < ApplicationRecord
  resourcify

  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  validates :photo, presence: true, content_type: [:png, :jpg, :jpeg]

  scope :filter_by_title, -> { order(title: :asc) }

  default_scope filter_by_title
end
