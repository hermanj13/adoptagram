class RenameColumn < ActiveRecord::Migration
  def change
    change_table :agency_contacts do |t|
      t.rename :street_number, :address1
      t.rename :street, :address2
    end
    change_table :user_contacts do |t|
      t.rename :street_number, :address1
      t.rename :street, :address2
    end
  end
end
