class Item < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  delegate :name, to: :product
  delegate :price, to: :product
end
