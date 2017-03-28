class Message < ActiveRecord::Base
  belongs_to :agency
  belongs_to :user
  belongs_to :animal
end
