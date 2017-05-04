class Post < ActiveRecord::Base
  belongs_to :animal
  belongs_to :agency
  has_many :comments, dependent: :destroy

  validates :description, presence: true
end
