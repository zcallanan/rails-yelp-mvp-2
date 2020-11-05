# Destroy existing data
Restaurant.destroy_all
Review.destroy_all

array = %w[chinese italian japanese french belgian]

# Create 10 restaurants
10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: array.sample
  )
  # Save restaurant to DB
  restaurant.save
end

# Get all restaurants
restaurants = Restaurant.all

# Create 10 reviews on a random restaurant
10.times do
  # random restaurant
  restaurant = restaurants.sample
  review = Review.new(
    content: Faker::Restaurant.review,
    rating: (0..5).to_a.sample,
    restaurant_id: restaurant.id
  )
  # Save review to DB
  review.save
end

puts 'Done!'
