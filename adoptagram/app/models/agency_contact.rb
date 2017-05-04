class AgencyContact < ActiveRecord::Base
  belongs_to :agency
  zip_regex = /\d{5}/
  validates :address1, :city, :state, presence: true
  validates :zip, presence: true, format: { with: zip_regex }, length: {is: 5}
  before_validation :cityCap
  private
    def cityCap
      self.city = city.downcase.titleize
    end
end
