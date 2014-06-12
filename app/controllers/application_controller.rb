class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def current_cart
  if Cart.count == 0
    @cart = Cart.new
    @cart.save!
    session[:cart_id] = @cart.id
  end
  if session[:cart_id]
    @current_cart ||= Cart.find(session[:cart_id])
    session[:cart_id] = nil if @current_cart.purchased_at
  end
  if session[:cart_id].nil?
    @current_cart = Cart.create!
    session[:cart_id] = @current_cart.id
  end
  @current_cart
end
end
