class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :commenter, polymorphic: true

  validates :comment, presence: true
end
