class AddStudioIdToProductions < ActiveRecord::Migration[5.1]
  def change
    add_column :productions, :studio_id, :integer
  end
end
