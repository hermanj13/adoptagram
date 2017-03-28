class CreateAgencyContacts < ActiveRecord::Migration
  def change
    create_table :agency_contacts do |t|
      t.references :agency, index: true, foreign_key: true
      t.string :street_number
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :email

      t.timestamps null: false
    end
  end
end
