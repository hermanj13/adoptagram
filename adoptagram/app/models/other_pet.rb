class OtherPet < ActiveRecord::Base
  belongs_to :user

  validates :number, :animal_type, :discipline, presence: true
  validates_inclusion_of :vacinated, :fixed, :lost, in: [true,false]
  before_validation :numberCheck
  private
    def numberCheck
      if number == 0
        self.type = 'n/a'
        self.vacinated = false
        self.fixed = false
        self.lost = false
        self.discipline = 'n/a'
      end
    end
end
