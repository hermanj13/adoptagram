class UpdateForeignKeys < ActiveRecord::Migration
  def change
    remove_foreign_key :posts, :animals
    add_foreign_key :posts, :animals, on_delete: :cascade
  end
end
