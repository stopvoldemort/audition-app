class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :role_type
      t.integer :actor_id
      t.integer :production_id

      t.timestamps
    end
  end
end
