class ReplaceWithIsStudioColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :studio?
    add_column :users, :is_studio, :integer
  end
end
