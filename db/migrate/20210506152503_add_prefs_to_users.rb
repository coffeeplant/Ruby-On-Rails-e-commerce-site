class AddPrefsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :prefs, :string
  end
end
