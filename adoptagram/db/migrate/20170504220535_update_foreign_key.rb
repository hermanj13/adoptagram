class UpdateForeignKey < ActiveRecord::Migration
  def change
    remove_foreign_key :posts, :animals
    add_foreign_key :posts, :animals
  end
end
