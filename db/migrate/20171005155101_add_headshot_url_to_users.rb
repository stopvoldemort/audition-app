class AddHeadshotUrlToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :remote_headshot_url, :string
  end
end
