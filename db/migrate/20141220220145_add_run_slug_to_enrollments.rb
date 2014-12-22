class AddRunSlugToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :run_slug, :string
  end
end
