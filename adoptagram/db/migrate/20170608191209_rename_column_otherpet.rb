class RenameColumnOtherpet < ActiveRecord::Migration
  def change
    rename_column :other_pets, :type, :animal_type
  end
end
