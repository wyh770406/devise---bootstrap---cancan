class DeviceUser < ActiveRecord::Migration
  def up
    create_table(:devices_users, :id => false) do |t|
      t.references :device
      t.references :user
    end
  end

  def down
  end
end
