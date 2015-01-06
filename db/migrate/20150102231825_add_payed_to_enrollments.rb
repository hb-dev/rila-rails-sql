class AddPayedToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :payed, :boolean
  end
end
