class CartController < ApplicationController

  
  def add
    #get the Id of the product
    id = params[:id]
    
    #if the cart has already been created, use existing cart or else create a bank cart
    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end
    
    #If the product is already added it increments by 1, else sets producr to 1
    if cart[id] then
      cart[id] = cart[id] + 1
    else
      cart[id] = 1
    end
    
  redirect_to :action => :index
  end
  
  def clearCart
    #sets the session variable to nil and brings user back to index page
    session[:cart] = nil
    redirect_to :action => :index
  end
  
  def index
    #Passes a cart to display
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end
  
  
end

