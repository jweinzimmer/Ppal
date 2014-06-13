class PaymentNotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]
  
  def create
    PaymentNotification.create!(:params => params, :cart_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
    render :nothing => true
  end
private
  def payment_params
    params.require(:paymentnotification).permit(:params, :cart_id, :status, :transaction_id)
  end
end