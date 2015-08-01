class AddProjectToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :project_id, :integer
    add_index :videos, :project_id
  end
end
