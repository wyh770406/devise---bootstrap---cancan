class AddDevicesn < ActiveRecord::Migration
  def up
    add_column :users, :device_sn, :string,:default=>""
  end

  def down
  end
end
