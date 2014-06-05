class AddProductFields < ActiveRecord::Migration
  add_column :products, :name, :integer
  add_column :products, :price, :float
end
