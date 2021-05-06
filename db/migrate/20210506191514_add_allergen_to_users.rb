class AddAllergenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :allergen, :string
  end
end
