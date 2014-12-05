class AddAgeGroupToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :age_group, :string
  end
end
