class Vet < ActiveRecord::Base
  belongs_to :user
  validate :name, :clinic, presence: true
  validates :phone, length: {is: 10}, allow_blank: true
  validates_inclusion_of :have, in: [true,false]
  before_validation :haveVet
  private
    def haveVet
      if have = false
        self.name = 'n/a'
        self.clinic = 'n/a'
      end
    end
end
