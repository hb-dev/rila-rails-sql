class AddPickedUpToRelays < ActiveRecord::Migration
  def change
    add_column :relays, :picked_up, :boolean
  end
end
