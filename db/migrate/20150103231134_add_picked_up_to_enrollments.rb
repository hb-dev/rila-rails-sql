class AddPickedUpToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :picked_up, :boolean
  end
end
