class RemoveWeightFromAnimal < ActiveRecord::Migration
  def change
    remove_column :animals, :weight, :string
  end
end
