class StaticPagesController < ApplicationController

  def home
    @categories = Category.all
    @meals = Meal.all
  end

  def help

  end

  def about
  end

  def admin
    if current_user.role == "Admin" || current_user.role == "Staff"
    
    else
      redirect_to "/"
    end
    @orders = Order.all
  end 
  
  def adminorders
    if current_user.role == "Admin" || current_user.role == "Staff"
    
    else
      redirect_to "/"
    end
    @orders = Order.all
  end 
  
  def allusers
    if current_user.role == "Admin" || current_user.role == "Staff"
    
    else
      redirect_to "/"
    end
    
    @users = User.all
  end
  
  def adminmeals
    if current_user.role == "Admin" || current_user.role == "Staff"
    
    else
      redirect_to "/"
    end
    
    @meals = Meal.all
  end
  
  
  def contact
  end
  
  def profile
    @user = User.find(current_user.id)
  end
  
  def meat
    @user = User.find_by(id: params[:id])
     @user.update_attribute(:prefs, "Meat")
     redirect_to "/profile"
  end
  
  def vegetarian
    @user = User.find_by(id: params[:id])
     @user.update_attribute(:prefs, "Vegetarian")
     redirect_to "/profile"
  end
  
    def vegan
    @user = User.find_by(id: params[:id])
     @user.update_attribute(:prefs, "Vegan")
     redirect_to "/profile"
  end

  def prefclear
    @user = User.find_by(id: params[:id])
     @user.update_attribute(:prefs, nil)
     redirect_to "/profile"
  end

  def wheat
    @user = User.find_by(id: params[:id])
     @user.update_attribute(:allergen, "Wheat")
     redirect_to "/profile"
  end
  
  def nut
    @user = User.find_by(id: params[:id])
     @user.update_attribute(:allergen, "Nut")
     redirect_to "/profile"
  end
  
  def egg
    @user = User.find_by(id: params[:id])
     @user.update_attribute(:allergen, "Egg")
     redirect_to "/profile"
  end
  
  def allergenclear
    @user = User.find_by(id: params[:id])
     @user.update_attribute(:allergen, nil)
     redirect_to "/profile"
  end
  

  def upgradeadmin
    @user = User.find_by(id: params[:id])
     @user.update_attribute(:role, "Admin")
     redirect_to "/allusers"
  end
  
  def downgradeadmin
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:role, "Customer")
    redirect_to "/allusers"
  end
  
  def upgradestaff
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:role, "Staff")
    redirect_to "/allusers"
  end
  
  def downgradestaff
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:role, "Customer")
    redirect_to "/allusers"
  end
  
  # def ordercomplete
  #   @orders = Order.all
  #   @order = Order.find_by(id: params[:id])
  #       @orderitems = Orderitem.where(order_id: Order.last)
  # end
  
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
