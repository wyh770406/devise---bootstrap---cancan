class AddExtracolToUser < ActiveRecord::Migration
  def change
    add_column :users, :enable, :boolean,:default=>true
    add_column :users, :mobile, :string
    add_column :users, :birth, :date
    add_column :users, :session_level_id, :integer
  end
end
