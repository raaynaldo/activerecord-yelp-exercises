class Restaurant < ActiveRecord::Base
    has_many :dishes
    has_many :tags, through: :dishes

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
        # Dish.order("COUNT(restaurant_id) DESC").take(1)
        Restaurant.joins(:dishes).group("dishes.restaurant_id").select("restaurants.*, Count(*) as dishes_count").order("dishes_count DESC").take(1)
    end

    def self.focused
        # Restaurant.find_by_sql("
        #     SELECT R.* FROM restaurants AS R
        #     JOIN dishes AS D ON R.ID = D.restaurant_id
        #     GROUP BY R.ID HAVING COUNT(*) < 5
        #     ORDER BY COUNT(*) 
        #     ")
        Restaurant.joins(:dishes).group("dishes.restaurant_id").select("restaurants.*, Count(*) as dishes_count").order("dishes_count").having("Count(*) < 5")
    end

    def self.large_menu
        Restaurant.joins(:dishes).group("dishes.restaurant_id").select("restaurants.*, Count(*) as dishes_count").having("Count(*) > 20")
    end

    def self.vegetarian
        # Restaurant.joins(dishes: :tags).where("tags.name ='vegetarian'")
        Tag.where(:name => "vegetarian")[0].dishes.map do |dish|
            dish.restaurant
        end

    end

    def self.name_like(name)
        Restaurant.where("name LIKE ?", "%#{name}%")
    end

    def self.name_not_like(name)
        Restaurant.where("name NOT LIKE ?", "%#{name}%")
    end
end