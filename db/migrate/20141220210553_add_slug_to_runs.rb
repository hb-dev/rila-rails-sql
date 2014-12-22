class AddSlugToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :slug, :string
    add_index :runs, :slug, unique: true
  end
end
