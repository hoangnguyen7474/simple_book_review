class Category < ApplicationRecord
  resourcify
  has_many :books   
  default_scope { order(category_name: :asc) }  
end
