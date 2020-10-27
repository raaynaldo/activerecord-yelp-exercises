class Dish < ActiveRecord::Base
    has_many :dish_tags
    has_many :tags, through: :dish_tags
    belongs_to :restaurant

    # validates :name, presence: true
    # validates :restaurant, presence: true
    def self.names
        Dish.pluck(:name)
    end

    def self.max_tags
        Dish.joins(:dish_tags).group("dish_tags.dish_id").select("dishes.*, Count(*) as tag_counts").order("tag_counts DESC").limit(1)
    end

    def self.untagged
        Dish.left_outer_joins(:dish_tags).where("dish_tags.dish_id IS null")
    end

    def self.average_tag_count
        
    end

    def tag_count
        self.tags.count
    end

    def tag_names
        self.tags.pluck(:name)
    end

    def most_popular_tag
        
    end
end