class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :animal, index: true, foreign_key: true
      t.references :agency, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
