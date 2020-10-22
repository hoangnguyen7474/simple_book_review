class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

   scope :lastest, -> { order('comments.created_at DESC') }

  validates :body, presence: true, allow_blank: false
end
