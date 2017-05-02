class RemoveIntegerFromAnimal < ActiveRecord::Migration
  def change
    remove_column :animals, :integer, :string
  end
end
