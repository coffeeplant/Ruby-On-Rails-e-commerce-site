# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Meal.create([
    {mealName: 'Lasagne', description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', image_url: 'beef.jpeg', category: 'beef', mealAllergens: 'Wheat', price: 7},
    {mealName: 'Fish Pie', description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', image_url: 'fish.jpeg', category: 'fish', mealAllergens: 'Fish', price: 8.5},
    {mealName: 'Chickpea Curry', description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', image_url: 'salad.jpeg', category: 'vegan', mealAllergens: 'Soy', price: 8.5},
    {mealName: 'Eggs Benedict', description: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', image_url: 'eggs.jpeg', category: 'vegetarian', mealAllergens: 'Egg', price: 8.5},
    ])

User.create([{email: 'user@email.com', encrypted_password: 'password',prefs: 'Vegan', allergen: 'Wheat', name: 'Bebhinn Hare', address: 'Test Town', phone: '555-1010', role: 'User'},{email: 'staff@email.com', encrypted_password: 'password',prefs: 'Meat', allergen: 'Soy', name: 'Tom Jones', address: 'Test Street', phone: '555-0000', role: 'Staff'},{email: 'admin@email.com', encrypted_password: 'password',prefs: 'Fish', allergen: '', name: 'Lind Desmond', address: 'Test Lane', phone: '555-6666', role: 'Admin'},
    ])
    
    
