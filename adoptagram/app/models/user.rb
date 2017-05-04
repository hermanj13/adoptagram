class User < ActiveRecord::Base
  has_many :adoption_applications, dependent: :destroy
  has_many :foster_applications, dependent: :destroy
  has_many :animals_adopting, through: :adoption_applications, source: :Animal, dependent: :destroy
  has_many :animals_fostering, through: :foster_applications, source: :Animal, dependent: :destroy

  has_many :messages, dependent: :destroy
  has_many :agencys_messaged, through: :messages, source: :agency, dependent: :destroy

  has_many :comments, as: :commenter, dependent: :destroy

  has_one :other_pet, dependent: :destroy
  has_one :vet, dependent: :destroy
  has_one :family_info, dependent: :destroy
  has_one :user_contact, dependent: :destroy

  has_secure_password
  URL_REGEX = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[\-;:&=\+\$,\w]+@)?[A-Za-z0-9\.\-]+|(?:www\.|[\-;:&=\+\$,\w]+@)[A-Za-z0-9\.\-]+)((?:\/[\+~%\/\.\w\-_]*)?\??(?:[\-\+=&;%@\.\w_]*)#?(?:[\.\!\/\\\w]*))?)/

  validates :username, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URL_REGEX }
  before_create validates :password, length: {minimum: 8}
  before_validation :emailLower, :usernameLower
  private
    def emailLower
      self.email = email.downcase
    end
    def usernameLower
      self.username = username.downcase
    end
end
