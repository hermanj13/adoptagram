class Agency < ActiveRecord::Base
  has_secure_password
  has_many :animals

  has_one :agency_contact

  has_many :messages
  has_many :users_messaged, through: :messages, source: :user

  has_many :comments, as: :commenter

  has_many :adoption_applications
  has_many :foster_applications

  has_many :posts
end
