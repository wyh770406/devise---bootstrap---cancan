class AddLogable < ActiveRecord::Migration
  def up

    add_column :logs, :logable_id, :integer
    add_column :logs, :logable_type, :string

  end

  def down
  end
end
