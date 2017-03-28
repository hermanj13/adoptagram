class User < ActiveRecord::Base
  has_secure_password
  has_many :adoption_applications
  has_many :foster_applications
  has_many :animals_adopting, through: :adoption_applications, source: :Animal
  has_many :animals_fostering, through: :foster_applications, source: :Animal

  has_many :messages
  has_many :agencys_messaged, through: :messages, source: :agency

  has_many :comments, as: :commenter

  has_one :other_pet
  has_one :vet
  has_one :family_info
  has_one :user_contact
end
