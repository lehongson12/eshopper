class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :tel, :string
    add_column :users, :bio, :string
    add_column :users, :avatar, :string
  end
end
