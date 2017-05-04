class UserContact < ActiveRecord::Base
  belongs_to :user
  zip_regex = /\d{5}/
  URL_REGEX = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[\-;:&=\+\$,\w]+@)?[A-Za-z0-9\.\-]+|(?:www\.|[\-;:&=\+\$,\w]+@)[A-Za-z0-9\.\-]+)((?:\/[\+~%\/\.\w\-_]*)?\??(?:[\-\+=&;%@\.\w_]*)#?(?:[\.\!\/\\\w]*))?)/

  validates :first, :last, :occupation, :address1, :city, :state, :phone, :best_contact, presence: true
  validates :address2, allow_blank: true
  validates :zip, presence: true, format: { with: zip_regex }, length: {is: 5}
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URL_REGEX }

  before_validation :cityCap, :firstCap, :lastCap, :occCap, :emailLower, :phoneSimplify

  private
    def firstCap
      self.first = first.downcase.titleize
    end
    def lastCap
      self.last = last.downcase.titleize
    end
    def occCap
      self.occupation = occupation.downcase.titleize
    end
    def cityCap
      self.city = city.downcase.titleize
    end
    def emailLower
      self.email = email.downcase
    end
    def phoneSimplify
      self.phone = phone.gsub(/\D/, "")
    end
end
