class CreateRelays < ActiveRecord::Migration
  def change
    create_table :relays do |t|
      t.integer :run_id
      t.string :name

      t.timestamps
    end
  end
end
