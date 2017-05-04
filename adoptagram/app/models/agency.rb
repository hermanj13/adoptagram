class Agency < ActiveRecord::Base
  has_many :animals, dependent: :destroy

  has_one :agency_contact, dependent: :destroy

  has_many :messages, dependent: :destroy
  has_many :users_messaged, through: :messages, source: :user, dependent: :destroy

  has_many :comments, as: :commenter, dependent: :destroy

  has_many :adoption_applications, dependent: :destroy
  has_many :foster_applications, dependent: :destroy

  has_many :posts, dependent: :destroy

  has_secure_password
  URL_REGEX = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[\-;:&=\+\$,\w]+@)?[A-Za-z0-9\.\-]+|(?:www\.|[\-;:&=\+\$,\w]+@)[A-Za-z0-9\.\-]+)((?:\/[\+~%\/\.\w\-_]*)?\??(?:[\-\+=&;%@\.\w_]*)#?(?:[\.\!\/\\\w]*))?)/

  validates :name, presence: true
  validates :username, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URL_REGEX }
  validates :website, presence: true, uniqueness: { case_sensitive: false }, format: { with: URL_REGEX }

  before_create validates :password, length: {minimum: 8}
  before_validation :agencyCapitalize, :emailLower, :usernameLower

  private
    def agencyCapitalize
      self.name = name.downcase.titleize
    end
    def emailLower
      self.email = email.downcase
    end
    def usernameLower
      self.username = username.downcase
    end
end
