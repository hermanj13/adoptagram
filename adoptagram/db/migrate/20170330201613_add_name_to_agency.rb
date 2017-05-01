class AddNameToAgency < ActiveRecord::Migration
  def change
    add_column :agencies, :name, :string
  end
end
