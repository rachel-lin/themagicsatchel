class Project < ActiveRecord::Base
    belongs_to :user
    has_many :texts, dependent: :destroy
    has_many :image_posts, dependent: :destroy
end
