class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :public, default: true

      t.timestamps null: false
    end
  end
end
