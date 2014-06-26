class AddSnappedToSnapLogin < ActiveRecord::Migration
  def change
    add_column :snap_logins, :public_key, :text
    add_column :snap_logins, :snapped, :boolean
  end
end
