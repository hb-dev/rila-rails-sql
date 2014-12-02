class AddEventIdToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :event_id, :integer
  end
end
