class AddPublicIdToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :public_id, :string
  end
end
