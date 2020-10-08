class Category < ApplicationRecord
  has_many :books 
  resourcify

  scope :category_all, -> { order(category_name: :asc) }
end
