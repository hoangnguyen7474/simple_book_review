class Category < ApplicationRecord
  resourcify
  has_many :books 
end
