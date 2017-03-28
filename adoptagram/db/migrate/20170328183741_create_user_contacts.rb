class CreateUserContacts < ActiveRecord::Migration
  def change
    create_table :user_contacts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :first
      t.string :last
      t.string :occupation
      t.string :street_number
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email
      t.string :best_contact

      t.timestamps null: false
    end
  end
end
