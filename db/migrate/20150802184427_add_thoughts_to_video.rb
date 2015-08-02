class AddThoughtsToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :thoughts, :string
  end
end
