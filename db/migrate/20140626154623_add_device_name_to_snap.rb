class AddDeviceNameToSnap < ActiveRecord::Migration
  def change
    add_column :snap_logins, :device_name, :text
  end
end
