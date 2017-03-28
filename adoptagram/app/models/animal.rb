class Animal < ActiveRecord::Base
  belongs_to :agency

  has_many :posts
  has_many :adoption_applications
  has_many :foster_applications
  has_many :messages
end
