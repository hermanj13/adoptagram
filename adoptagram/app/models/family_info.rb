class FamilyInfo < ActiveRecord::Base
  belongs_to :user

  validates :adults, :children, :home_type, :description, :landlord, :allergies, :agreement, :time, presence: true
  validates :phone, length: {is: 10}, allow_blank: true
  before_validation :phoneSimplify, :landCheck
  private
    def landCheck
      self.landlord ||= "n/a"
    end
    def phoneSimplify
      if phone
        self.phone = phone.gsub(/\D/, "")
      end
    end
end
