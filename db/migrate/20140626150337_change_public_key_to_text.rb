class ChangePublicKeyToText < ActiveRecord::Migration
  def change
    change_column :devices, :public_key, :text
  end
end
