# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Product.create([{name: 'iPhone 12', brand: 'Apple', price: 799.99}, 
{name: 'Samsung Galaxy S21', brand: 'Samsung', price: 699.99}, 
{name: 'Pixel 5', brand: 'Google', price: 699.99}, 
{name: 'OnePlus 9R', brand: 'OnePlus', price: 699.99},
{name: 'Xiaomi Mi 11', brand: 'Xiaomi', price: 599.99}])