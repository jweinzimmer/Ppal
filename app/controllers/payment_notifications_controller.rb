class PaymentNotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]
  
  def create
  	 
  	 @payment = PaymentNotification.new()
     @payment.save!
     @cart = Cart.last

     @payment.update_attributes(:params => params, :cart_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])

		 session[:cart_id] = @payment.cart_id
				# binding.pry
   	if @payment.status == "Completed"
			@payment.cart.update_attribute(:purchased_at, Time.now)
		end

		if session[:cart_id]
	    @current_cart ||= Cart.find(session[:cart_id])
	    session[:cart_id] = nil if @current_cart.purchased_at
  	end
  	session[:cart_id]

    render :nothing => true


  end
private
  def payment_params
    params.require(:paymentnotification).permit(:params, :cart_id, :status, :transaction_id)
  end
end