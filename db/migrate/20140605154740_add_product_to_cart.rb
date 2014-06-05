class AddProductToCart < ActiveRecord::Migration
  add_column :products, :cart_id, :integer
end
