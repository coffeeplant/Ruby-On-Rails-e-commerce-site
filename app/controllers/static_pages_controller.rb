class StaticPagesController < ApplicationController
  

    
  def home
    @categories = Category.all
    @meals = Meal.all
    current_user.update_attribute :admin, true
  end

  def help

  end

  def about
  end
  
  def paid
    # redirect_to "/cart/clear"
    flash[:notice] = 'Transaction Complete'
    @order = Order.last
    @order.update_attribute(:status, "Paid by User: #{current_user.email}")
    #"Paid By User:#{current_user.id}#(current_user.name}#{current_user.surname}")
  end
  
  # def paid
  #   #redirect_to "/cart/clear"
  #   @order = Order.find_by_id(id: params[:id])
  #   @order.update_attribute(:status, "Paid by User:#{current_user.email}")
  #   #"Paid By User:#{current_user.id}#(current_user.name}#{current_user.surname}")
  # end
  
  def category
    catName = params[:title]
    @meals = Meal.where("category like ?", catName)
  end
  

  
  def thankyou
    id = params[:id]
    paypalID = params[:PayerID]
    @order = Order.find_by_id(id)
    @order.update_attribute(:status, "Paid with Paypal")
    
    
  end
  
end
