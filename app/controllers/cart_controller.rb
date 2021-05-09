class CartController < ApplicationController
  before_action :authenticate_user!
  
  def add
    #get the Id of the product
    id = params[:id]
    
    #if the cart has already been created, use existing cart or else create a blank cart
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
  
  def increase
    id = params[:id]
    cart = session[:cart]
    
      cart[id] = cart[id] + 1
    #redirects to cart index view page
    redirect_to:action => :index
  end
  
  def createOrder
    # Get the current user
    @user = User.find(current_user.id)
    
    #create new order and associate it with the current user
    @order = @user.orders.build(:order_date => DateTime.now, :status => 'Pending')
    @order.save
    
    #For each meal in the cart, create a new item on the order
    @cart = session[:cart] || {} #get the content of the Cart
   
      @cart.each do | id, quantity |
        meal = Meal.find_by_id(id)

        @orderitem = @order.orderitems.build(
          :item_id => meal.id,
          :mealName => meal.mealName, 
          :description => meal.description,
          :quantity => quantity,
          :price=> meal.price)
        
        @orderitem.save
      
      end
    
    @orders = Order.all
    
    #can modify this to allow orders that are not paid for, find the order by id in this case
    @orderitems = Orderitem.where(order_id: Order.last)
    #redirect_to '/ordercomplete'
    session[:cart] =nil

  end
  
  #This code was part of an attempt to create an order static page
  # def ordercomplete
  #   @order = Order.limit(1).order(id: :desc).where(user: User.find(current_user.id))
  #   @orderitems = Orderitem.where(order_id: Order.limit(1).order(id: :desc).where(user: User.find(current_user.id)))
     
    #Permission.find_by(user_id: params[:user_id], project_id: params[:project_id])
    # end
end

