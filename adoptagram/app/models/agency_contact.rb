class AgencyContact < ActiveRecord::Base
  belongs_to :agency
  zip_regex = /\d{5}/
  validates :street_number, :street, :city, :state, presence: true
  validates :zip, presence: true, format: { with: zip_regex }, length: {is: 5}
  before_validation :streetCap, :cityCap
  private
    def streetCap
      self.steet = street.downcase.titleize
    end
    def cityCap
      self.city = city.downcase.titleize
    end
end
