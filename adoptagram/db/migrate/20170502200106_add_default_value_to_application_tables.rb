class AddDefaultValueToApplicationTables < ActiveRecord::Migration
  def up
    change_column_default :foster_applications, :contacted, false
    change_column_default :foster_applications, :interviewed, false
    change_column_default :foster_applications, :approved, false
    change_column_default :foster_applications, :accepted, false
    change_column_default :adoption_applications, :contacted, false
    change_column_default :adoption_applications, :interviewed, false
    change_column_default :adoption_applications, :approved, false
    change_column_default :adoption_applications, :accepted, false
  end
  def down
    change_column_default :foster_applications, :contacted, nil
    change_column_default :foster_applications, :interviewed, nil
    change_column_default :foster_applications, :approved, nil
    change_column_default :foster_applications, :accepted, nil
    change_column_default :adoption_applications, :contacted, nil
    change_column_default :adoption_applications, :interviewed, nil
    change_column_default :adoption_applications, :approved, nil
    change_column_default :adoption_applications, :accepted, nil
  end
end
