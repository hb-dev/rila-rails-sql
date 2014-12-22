class AddKidsToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :kids, :boolean
  end
end
