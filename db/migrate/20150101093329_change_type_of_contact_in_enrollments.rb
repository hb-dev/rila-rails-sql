class ChangeTypeOfContactInEnrollments < ActiveRecord::Migration
  def change
  	change_column :enrollments, :runner_contact, :string
  end
end