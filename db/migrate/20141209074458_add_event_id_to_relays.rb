class AddEventIdToRelays < ActiveRecord::Migration
  def change
    add_column :relays, :event_id, :integer
  end
end
