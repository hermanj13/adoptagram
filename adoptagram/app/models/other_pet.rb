class OtherPet < ActiveRecord::Base
  belongs_to :user

  validates :number, :animal_type, :discipline, presence: true
  validates :vacinated, :fixed, :lost, inclusion: { in: [ true, false ] }
  before_validation :numberCheck
  private
    def numberCheck
      if number == 0
        self.animal_type = 'n/a'
        self.vacinated = false
        self.fixed = false
        self.lost = false
        self.discipline = 'n/a'
      end
    end
end
