class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :website

      t.timestamps null: false
    end
  end
end
