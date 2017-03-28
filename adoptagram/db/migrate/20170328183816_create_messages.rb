class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :agency, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :animal, index: true, foreign_key: true
      t.boolean :read
      t.string :subject
      t.text :message

      t.timestamps null: false
    end
  end
end
