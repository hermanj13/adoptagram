class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.references :agency, index: true, foreign_key: true
      t.string :name
      t.string :breed
      t.date :birthday
      t.string :gender
      t.string :weight
      t.string :integer
      t.string :species
      t.boolean :adopted
      t.boolean :fostered

      t.timestamps null: false
    end
  end
end
