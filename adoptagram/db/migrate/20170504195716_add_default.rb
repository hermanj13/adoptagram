class AddDefault < ActiveRecord::Migration
  def up
    change_column_default :animals, :adopted, false
    change_column_default :animals, :fostered, false
  end
  def down
    change_column_default :animals, :adopted, nil
    change_column_default :animals, :fostered, nil
  end
end
