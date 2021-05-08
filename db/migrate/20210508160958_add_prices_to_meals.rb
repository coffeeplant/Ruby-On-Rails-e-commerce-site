class AddPricesToMeals < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :price2, :decimal
    add_column :meals, :price3, :decimal
  end
end
