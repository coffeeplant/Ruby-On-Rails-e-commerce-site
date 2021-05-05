class StaticPagesController < ApplicationController

  def home
    @categories = Category.all
    @meals = Meal.all
  end

  def help
    #current_user.update_attribute :admin, true
            # session[:cart] = nil
      # if current_user.admin?
      # else
      #   redirect_to "/"
      # end
      #   @users = User.all
  end

  def about
  end

  def admin
    if current_user&.admin?
    
    else
      redirect_to "/"
    end
    @orders = Order.all
  end 
  
  def adminorders
    if current_user&.admin?
    
    else
      redirect_to "/"
    end
    @orders = Order.all
  end 
  
  def allusers
    if current_user&.admin?
    
    else
      redirect_to "/"
    end
    
    @users = User.all
  end
  
  def contact
  end

  def upgrade
    @user = User.find_by(id: params[:id])
     @user.update_attribute(:admin, true)
     redirect_to "/allusers"
  end
  
  def downgrade
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:admin, false)
    redirect_to "/allusers"
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
