class CreateOtherPets < ActiveRecord::Migration
  def change
    create_table :other_pets do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :number
      t.text :type
      t.boolean :vacinated
      t.boolean :fixed
      t.boolean :lost
      t.text :discipline

      t.timestamps null: false
    end
  end
end
