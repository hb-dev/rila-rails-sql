class AddPayedToRelays < ActiveRecord::Migration
  def change
    add_column :relays, :payed, :boolean
  end
end
