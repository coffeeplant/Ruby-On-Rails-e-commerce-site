class AddDefaultValueToAdminAttribute < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :admin, :boolean, :default => false
  end
  
  def up
    change_column :users, :admin, :boolean, :null => false
  end
end
