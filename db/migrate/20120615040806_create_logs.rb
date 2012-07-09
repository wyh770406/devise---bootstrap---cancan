class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs, :options => 'ENGINE=InnoDB AUTO_INCREMENT=1 default charset=utf8' do |t|
      t.string :from,              :null => false, :default => ""
      t.integer :level, :default => 0
      t.string :cat,              :null => false, :default => ""
      t.text :msg

      t.timestamps
    end
  end
end
