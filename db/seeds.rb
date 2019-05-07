PLACEHOLDER_IMAGE = "https://via.placeholder.com/600x400"
LOREM = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
COLORS = ["red", "green", "blue", "pink", "purple", "orange", "black", "white"]

# How many seeded product samples do you want?
PRODUCT_SEED_COUNT = 3

def random_price # random price between 10 ~ 100.
  rand(1..10)*10
end

def random_color
  COLORS.sample
end

user = User.create!(first_name: "user", last_name: "foo", email: "user@email.com", password: "password")

1.upto(PRODUCT_SEED_COUNT) do |i|
  Product.create(name:"seed-generated product ##{i}", description: LOREM, image_url: PLACEHOLDER_IMAGE, color: random_color, price: random_price)
end

# Order.create(user_id: 1, product_id: 1, total: 1000.00)
# Order.create(user_id: 1, product_id: 2, total: 5000.0)

# Comment.create!(user: user, product: Product.first, rating: 1, body: "bad")
# Comment.create!(user: user, product: Product.first, rating: 4, body: "nice")
# Comment.create!(user: user, product: Product.first, rating: 2, body: "meh")
