class AddUserbool < ActiveRecord::Migration
  def change
    add_column :messages, :userbool, :boolean
    change_column_default :messages, :userbool, false
  end
end
