class CreateCallnoPools < ActiveRecord::Migration
  def change
    create_table :callno_pools,:options => 'ENGINE=InnoDB AUTO_INCREMENT=1 default charset=utf8' do |t|
      t.string :name,:limit=>40,:default=>""
      t.text :desc
      t.integer :start_callno,:default=>0
      t.integer :end_callno,:default=>0
      t.boolean :is_default ,:default=>false
      t.timestamps
    end
  end
end
