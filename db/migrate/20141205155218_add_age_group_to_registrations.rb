class AddAgeGroupToRegistrations < ActiveRecord::Migration
  def change
    add_column :enrollments, :age_group, :string
  end
end
