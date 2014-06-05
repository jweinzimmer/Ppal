class Cart < ActiveRecord::Base
  has_many :products
  has_many :items

def paypal_url(return_url)
    values = {
      :business => 'jasonc@kyn.is',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id
    }
    items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.price,
        "item_name_#{index+1}" => item.name,
        "item_number_#{index+1}" => item.id,
        "quantity_#{index+1}" => 1
      })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
