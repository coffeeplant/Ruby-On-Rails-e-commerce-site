class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :mealName
      t.text :description
      t.string :image_url
      t.string :category
      t.string :mealAllergens
      t.decimal :price
      t.integer :orderCount

      t.timestamps
    end
  end
end
