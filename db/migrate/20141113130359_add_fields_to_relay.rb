class AddFieldsToRelay < ActiveRecord::Migration
  def change
    add_column :relays, :contact_title, :string
    add_column :relays, :contact_name, :string
    add_column :relays, :contact_firstname, :string
    add_column :relays, :contact_street, :string
    add_column :relays, :contact_city, :string
    add_column :relays, :contact_zip, :string
    add_column :relays, :contact_country, :string
    add_column :relays, :contact_email, :string
  end
end
