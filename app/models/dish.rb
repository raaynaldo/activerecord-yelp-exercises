class Dish < ActiveRecord::Base
    has_many :dish_tags
    has_many :tags, through: :dish_tags
    belongs_to :restaurant
    # validates :name, presence: true
    # validates :restaurant, presence: true
end