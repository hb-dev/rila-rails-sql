class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :run_id
      t.integer :startnumber
      t.integer :transponder
      t.time :finishtime
      t.string :runner_title
      t.string :runner_name
      t.string :runner_firstname
      t.string :runner_street
      t.string :runner_city
      t.string :runner_zip
      t.string :runner_country
      t.date :runner_date_of_birth
      t.string :runner_gender
      t.string :runner_contact
      t.string :runner_email
      t.string :runner_organisation

      t.timestamps
    end
  end
end
