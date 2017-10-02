class CreateProductions < ActiveRecord::Migration[5.1]
  def change
    create_table :productions do |t|
      t.string :title
      t.string :production_type
      t.integer :budget
      t.date :date_begin
      t.date :date_end

      t.timestamps
    end
  end
end
