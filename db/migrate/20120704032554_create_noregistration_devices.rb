class CreateNoregistrationDevices < ActiveRecord::Migration
  def change
    create_table :noregistration_devices,:options => 'ENGINE=InnoDB AUTO_INCREMENT=1 default charset=utf8' do |t|
      t.string   :sn_no, :limit => 40, :null => false, :default => ""
      t.string   :name, :null => false, :default => ""
      t.string   :mac_address
      t.string   :ip_address
      t.boolean  :registration_status, :default => false
      t.timestamps


    end
      add_index :session_levels, :slevel_code,  :unique => true
      add_index :noregistration_devices, :sn_no,  :unique => true
      add_index :noregistration_devices, :name,  :unique => true
  end
end
