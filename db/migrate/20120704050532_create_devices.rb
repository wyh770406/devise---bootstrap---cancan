class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices,:options => 'ENGINE=InnoDB AUTO_INCREMENT=1 default charset=utf8' do |t|
      t.string   :sn_no, :limit => 40, :null => false, :default => ""
      t.string   :name, :null => false, :default => ""
      t.text     :desc
      t.string   :callno, :limit => 10, :null => false, :default => ""
      t.string   :callpass, :limit => 10, :null => false, :default => ""
      t.integer  :user_id, :null => false, :default => 0
      t.string   :mac_address
      t.string   :ip_address
      t.timestamps
    end
      add_index :devices, :sn_no,  :unique => true
      add_index :devices, :name,  :unique => true
      add_index :devices, :callno,  :unique => true
  end
end
