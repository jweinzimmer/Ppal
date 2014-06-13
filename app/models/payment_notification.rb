class PaymentNotification < ActiveRecord::Base
	belongs_to :cart
	serialize :params
end
