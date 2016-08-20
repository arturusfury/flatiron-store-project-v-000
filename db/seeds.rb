10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

password = Faker::Internet.password
User.create!(
  name: Faker::Name.name,
  email: Faker::Internet.safe_email,
  password: password,
  password_confirmation: password
)
