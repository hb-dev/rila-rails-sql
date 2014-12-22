class ChangeTypeInEnrollments < ActiveRecord::Migration
  def change
  	change_column :enrollments, :runner_contact, :text
  end
end
