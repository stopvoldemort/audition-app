class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.boolean :studio?
      t.integer :base_salary

      t.timestamps
    end
  end
end
