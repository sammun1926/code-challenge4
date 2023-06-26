class CreateRestaurantPizzas < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_pizzas do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :pizza, null: false, foreign_key: true
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
