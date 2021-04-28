json.extract! meal, :id, :mealName, :description, :image_url, :category, :mealAllergens, :price, :orderCount, :created_at, :updated_at
json.url meal_url(meal, format: :json)
