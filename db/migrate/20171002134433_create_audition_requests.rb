class CreateAuditionRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :audition_requests do |t|
      t.integer :actor_id
      t.integer :role_id
      t.boolean :accepted?

      t.timestamps
    end
  end
end
