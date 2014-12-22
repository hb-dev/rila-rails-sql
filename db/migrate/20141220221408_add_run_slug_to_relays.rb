class AddRunSlugToRelays < ActiveRecord::Migration
  def change
    add_column :relays, :run_slug, :string
  end
end
