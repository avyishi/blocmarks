class AddEmailPermissionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_likes, :boolean, default: false
  end
end
