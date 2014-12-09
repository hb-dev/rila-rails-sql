class AddStartnumberToRelays < ActiveRecord::Migration
  def change
    add_column :relays, :startnumber, :integer
  end
end
