class AddUserIdToSnapLogin < ActiveRecord::Migration
  def change
    add_column :snap_logins, :user_id, :integer
    add_column :snap_logins, :url, :string
  end
end
