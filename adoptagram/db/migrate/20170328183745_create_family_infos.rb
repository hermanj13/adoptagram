class CreateFamilyInfos < ActiveRecord::Migration
  def change
    create_table :family_infos do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :adults
      t.integer :children
      t.string :home_type
      t.string :description
      t.string :landlord
      t.string :phone
      t.text :allergies
      t.boolean :agreement
      t.boolean :time

      t.timestamps null: false
    end
  end
end
