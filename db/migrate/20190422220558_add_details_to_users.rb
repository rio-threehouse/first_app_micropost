class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :description, :string
    add_column :users, :location, :string
    add_column :users, :birthday, :date
  end
end
