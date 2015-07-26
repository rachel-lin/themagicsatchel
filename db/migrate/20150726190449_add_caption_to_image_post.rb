class AddCaptionToImagePost < ActiveRecord::Migration
  def change
    add_column :image_posts, :caption, :string
  end
end
