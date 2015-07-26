class AddProjectToImagePosts < ActiveRecord::Migration
  def change
    add_column :image_posts, :project_id, :integer
    add_index :image_posts, :project_id
  end
end
