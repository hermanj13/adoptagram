class Post < ActiveRecord::Base
  belongs_to :animal
  belongs_to :agency

  validates :description, presence: true
end
