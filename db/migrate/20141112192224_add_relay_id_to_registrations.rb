class AddRelayIdToRegistrations < ActiveRecord::Migration
  def change
    add_column :enrollments, :relay_id, :integer
  end
end
