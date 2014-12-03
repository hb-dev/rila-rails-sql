class AddPriceFieldsToRuns < ActiveRecord::Migration
  def change
    add_column :runs, :price_adult_pre, :decimal, precision: 4, scale: 2
    add_column :runs, :price_child_pre, :decimal, precision: 4, scale: 2
    add_column :runs, :price_adult, :decimal, precision: 4, scale: 2
    add_column :runs, :price_child, :decimal, precision: 4, scale: 2
  end
end
