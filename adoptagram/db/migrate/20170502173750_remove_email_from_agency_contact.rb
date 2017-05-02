class RemoveEmailFromAgencyContact < ActiveRecord::Migration
  def change
    remove_column :agency_contacts, :email, :string
  end
end
