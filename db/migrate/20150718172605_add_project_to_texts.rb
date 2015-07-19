class AddProjectToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :project_id, :integer
    add_index :texts, :project_id
  end
end
