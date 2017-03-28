class Post < ActiveRecord::Base
  belongs_to :animal
  belongs_to :agency
end
