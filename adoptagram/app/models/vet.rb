class Vet < ActiveRecord::Base
  belongs_to :user
  validates :name, :clinic, presence: true
  validates :phone, length: {is: 10}, allow_blank: true
  validates_inclusion_of :have, in: [true,false]
  before_validation :haveVet, :phoneSimplify
  private
    def haveVet
      if have == false
        self.name = 'n/a'
        self.clinic = 'n/a'
        self.phone = "0000000000"
      end
    end
    def phoneSimplify
        self.phone = phone.gsub(/\D/, "")
    end
end
