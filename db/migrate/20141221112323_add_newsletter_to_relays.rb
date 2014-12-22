class AddNewsletterToRelays < ActiveRecord::Migration
  def change
    add_column :relays, :newsletter, :boolean
  end
end
