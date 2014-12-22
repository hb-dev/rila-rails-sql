class AddNewsletterToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :newsletter, :boolean
  end
end
