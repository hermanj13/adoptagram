class Animal < ActiveRecord::Base
  belongs_to :agency

  has_many :posts, dependent: :destroy
  has_many :adoption_applications, dependent: :destroy
  has_many :foster_applications, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, :breed, :birthday, :gender, :weight, :species, presence: true
  before_validation :nameCap, :breedCap
  private
    def nameCap
      self.name = name.downcase.titleize
    end
    def breedCap
      self.breed = breed.downcase.titleize
    end
end
