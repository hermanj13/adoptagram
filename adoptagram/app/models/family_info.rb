class FamilyInfo < ActiveRecord::Base
  belongs_to :user

  validates :adults, :children, :home_type, :description, :landlord, :allergies, presence: true
  validates :phone, length: {is: 10}, allow_blank: true
  validates :agreement, :time, inclusion: { in: [ true, false ] }
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
