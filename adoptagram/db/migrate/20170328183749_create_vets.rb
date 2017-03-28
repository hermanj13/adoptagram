class CreateVets < ActiveRecord::Migration
  def change
    create_table :vets do |t|
      t.references :user, index: true, foreign_key: true
      t.boolean :have
      t.string :name
      t.string :clinic
      t.string :phone

      t.timestamps null: false
    end
  end
end
