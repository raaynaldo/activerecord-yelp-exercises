class Tag < ActiveRecord::Base
    has_many :dish_tags
    has_many :dishes, through: :dish_tags

    def self.most_common
        # DishTag.select("dish_id, Count(*)").group(:tag_id)
        Tag.joins(:dish_tags).select("tags.*, count(*) AS tag_count").group("tags.id").order("tag_count desc").limit(1)[0]
    end
end