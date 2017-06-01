class RenameMessageReadCollumn < ActiveRecord::Migration
  def change
    rename_column :messages, :read, :agencyread
    rename_column :messages, :userbool, :userread
  end
end
