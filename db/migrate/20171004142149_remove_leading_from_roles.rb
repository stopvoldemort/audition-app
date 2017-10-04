class RemoveLeadingFromRoles < ActiveRecord::Migration[5.1]
  def change
    remove_column :roles, :leading?
  end
end
