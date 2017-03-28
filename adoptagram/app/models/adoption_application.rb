class AdoptionApplication < ActiveRecord::Base
  belongs_to :animal
  belongs_to :agency
  belongs_to :user
end
