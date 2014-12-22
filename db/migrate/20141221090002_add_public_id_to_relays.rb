class AddPublicIdToRelays < ActiveRecord::Migration
  def change
    add_column :relays, :public_id, :string
  end
end
