class AddAgeGroupToRelays < ActiveRecord::Migration
  def change
    add_column :relays, :age_group, :string
  end
end
