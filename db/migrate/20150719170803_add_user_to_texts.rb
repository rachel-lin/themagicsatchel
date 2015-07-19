class AddUserToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :user_id, :integer
    add_index :texts, :user_id
  end
end
