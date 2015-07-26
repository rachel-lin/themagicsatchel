class AddUserToImagePosts < ActiveRecord::Migration
  def change
    add_column :image_posts, :user_id, :integer
    add_index :image_posts, :user_id
  end
end
