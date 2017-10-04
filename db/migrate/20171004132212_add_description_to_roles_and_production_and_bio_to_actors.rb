class AddDescriptionToRolesAndProductionAndBioToActors < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :description, :string
    add_column :productions, :description, :string
    add_column :users, :bio, :string, default: nil
  end
end
