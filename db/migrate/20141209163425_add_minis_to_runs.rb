class AddMinisToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :minis, :boolean
  end
end
