class CreateOrderitems < ActiveRecord::Migration[5.0]
  def change
    create_table :orderitems do |t|
      t.integer :item_id
      t.string :mealName
      t.text :description
      t.integer :quantity
      t.string :type
      t.decimal :price
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
