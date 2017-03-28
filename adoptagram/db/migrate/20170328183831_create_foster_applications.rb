class CreateFosterApplications < ActiveRecord::Migration
  def change
    create_table :foster_applications do |t|
      t.references :animal, index: true, foreign_key: true
      t.references :agency, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :comments
      t.boolean :contacted
      t.boolean :interviewed
      t.boolean :approved
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
