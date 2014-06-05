class ChangeName < ActiveRecord::Migration
  remove_column :products, :name, :integer
  add_column :products, :name, :string
end
