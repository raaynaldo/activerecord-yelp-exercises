class Restaurant < ActiveRecord::Base
    has_many :dishes
    # has_many :tags, through: :dishes

    def self.mcdonalds
        Restaurant.find_by(name: "McDonalds")
    end

    def self.tenth
        Restaurant.all[9]
    end

    def self.with_long_names
        Restaurant.where("LENGTH(name) > 12")
    end

    def self.max_dishes
        Dish.order("COUNT(restaurant_id) DESC").take(1)
    end
end