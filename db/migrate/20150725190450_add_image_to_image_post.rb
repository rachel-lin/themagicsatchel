class AddImageToImagePost < ActiveRecord::Migration
  def change
    add_column :image_posts, :image, :string
  end
end
