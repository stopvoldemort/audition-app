class RemoveRoleTypeFromRoles < ActiveRecord::Migration[5.1]
  def change
    remove_column :roles, :role_type
    add_column :roles, :leading?, :boolean
  end
end
