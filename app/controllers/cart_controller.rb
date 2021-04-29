class CartController < ApplicationController
  before_action :authenticate_user!
  
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
    
    #If the product is already added it increments by 1, else sets product to 1
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
  
  def remove 
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    
    redirect_to :action => :index
  end
  
  def decrease
    id = params[:id]
    cart = session[:cart]
    
    if cart[id] == 1 then
      cart.delete id
    else
      cart[id] = cart[id] - 1
    end
    #redirects to cart index view page
    redirect_to:action => :index
  end
  
  
end

