Dish.destroy_all
Tag.destroy_all
DishTag.destroy_all
Restaurant.destroy_all

20.times do
  Restaurant.find_or_create_by(name: Faker::Restaurant.name)
end

200.times do
  Dish.find_or_create_by(name: Faker::Food.dish)
end

15.times {
  Tag.find_or_create_by(name: Faker::Food.spice)
}

Dish.all.each do |dish|
  3.times do
    DishTag.find_or_create_by(dish_id: dish.id, tag_id: Tag.all.sample.id)
  end
end

Restaurant.all.each { |rest|
  10.times do
    rest.dishes << Dish.all.sample()
  end
}

# iterate over dishes and add three tags
# dishes.each { |dish|
#   dish.tags = tags.sample(3)
# }

# 20.times {
#   Restaurant.find_or_create_by(
#     name: Faker::Restaurant.name,
#     dish: dishes,
#   )
# }

# rest = Restaurant.find_or_create_by(name: "Mcd")
# rest = Restaurant.find_or_create_by(name: "Mcd")
# rest = Restaurant.find_or_create_by(name: "Mcd")
# rest = Restaurant.find_or_create_by(name: "Mcd")
# rest = Restaurant.find_or_create_by(name: "Mcd")

# rest = Restaurant.find_or_create_by(name: "Mcd")
# rest = Restaurant.find_or_create_by(name: "Mcd")
# rest = Restaurant.find_or_create_by(name: "Mcd")
# rest = Restaurant.find_or_create_by(name: "Mcd")
# rest = Restaurant.find_or_create_by(name: "Mcd")
