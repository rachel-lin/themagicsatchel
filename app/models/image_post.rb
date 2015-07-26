class ImagePost < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  mount_uploader :image, ImageUploader
end
