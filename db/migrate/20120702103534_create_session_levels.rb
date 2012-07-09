class CreateSessionLevels < ActiveRecord::Migration
  def change
    create_table :session_levels, :options => 'ENGINE=InnoDB AUTO_INCREMENT=1 default charset=utf8' do |t|
      t.string :slevel_code, :limit => 10, :null => false, :default => ""
      t.string   :slevel_name, :null => false, :default => ""
      t.text :slevel_desc, :null => true

      t.timestamps
    end

  end
end
