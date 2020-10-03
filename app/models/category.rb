class Category < ApplicationRecord
  has_many :books 
  resourcify
end
