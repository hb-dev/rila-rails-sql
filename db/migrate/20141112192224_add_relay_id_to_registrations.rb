class AddRelayIdToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :relay_id, :integer
  end
end
