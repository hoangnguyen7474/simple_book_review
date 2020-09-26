class Book < ApplicationRecord
  belongs_to :user
  resourcify
  has_many :comments, dependent: :destroy  
end
