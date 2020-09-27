class Book < ApplicationRecord
  belongs_to :user
  resourcify
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: { large: "600x600", medium: "300x300>", thumb: "100x100>" },  default_url: "/images/No_cover_available.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
