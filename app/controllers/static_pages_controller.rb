class StaticPagesController < ApplicationController

  def home
    @categories = Category.all
    @meals = Meal.all
  end

  def help
    @categories = Category.all
  end

  def about
  end
  
  
  
  

# PROTECTED METHODS FOR AUTHORISED USERS ONLY **************************
  def admin
    if current_user.role == "Admin" || current_user.role == "Staff"
    
    else
      redirect_to "/"
    end
    @orders = Order.all
  end 
  
  def adminorders
    if current_user.role == "Admin"
    
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
  
  def upgradeadmin
    if current_user.role == "Admin"
        @user = User.find_by(id: params[:id])
        @user.update_attribute(:role, "Admin")
        redirect_to "/allusers"
    else
      redirect_to "/"
    end
  end
  
  def downgradeadmin
    if current_user.role == "Admin"
      @user = User.find_by(id: params[:id])
      @user.update_attribute(:role, "Customer")
      redirect_to "/allusers"
    else
      redirect_to "/"
    end
  end
  
  def upgradestaff
    if current_user.role == "Admin"
      @user = User.find_by(id: params[:id])
      @user.update_attribute(:role, "Staff")
      redirect_to "/allusers"
    else
      redirect_to "/"
    end
  end
  
  def downgradestaff
    if current_user.role == "Admin"
      @user = User.find_by(id: params[:id])
      @user.update_attribute(:role, "Customer")
    redirect_to "/allusers"
    else
      redirect_to "/"
    end
  end
  
  # AUTHORISATION PROTECTED METHODS END
  
  
  
  
  
  def contact
  end
  
  def profile
    @user = User.find(current_user.id)
      if current_user.email != @user.email
        redirect_to "/"
      end
  end
  
  
  
  
  
  
  
  # CUSTOMER UPDATE METHODS *******************************
  def meat
    @user = User.find_by(id: params[:id])
     @user.update_attribute(:prefs, "Meat")
     redirect_to "/profile"
  end
  
  def fish
    @user = User.find_by(id: params[:id])
     @user.update_attribute(:prefs, "Fish")
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
     @user.update_attribute(:allergen, "Nuts")
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
  
  def deliveryname
    flash[:notice] = 'Name udpated'
    @user = User.find_by(id: params[:id])
    nam = "%#{params[:q]}%" 
    @user.update_attribute(:name, nam)
    redirect_to "/profile"
  end
  
  def deliveryaddress
    flash[:notice] = 'Address udpated'
    @user = User.find_by(id: params[:id])
    add = "%#{params[:q]}%" 
    @user.update_attribute(:address, add)
    redirect_to "/profile"
  end
 
  def deliveryphone
    flash[:notice] = 'Address udpated'
    @user = User.find_by(id: params[:id])
    ph = "%#{params[:q]}%" 
    @user.update_attribute(:phone, ph)
    redirect_to "/profile"
  end
 # END OF CUSTOMER UPDATE METHODS *******************************
 
 
 
 
 
 
 
  # def ordercomplete
  #   @orders = Order.all
  #   @order = Order.find_by(id: params[:id])
  #       @orderitems = Orderitem.where(order_id: Order.last)
  # end
  

  
  def category
    catName = params[:title]
    @meals = Meal.where("category like ?", catName)
  end
  
  def thankyou
    flash[:notice] = 'Transaction Complete'
    id = params[:id]
    paypalID = params[:PayerID]
    @order = Order.find_by_id(id)
    @order.update_attribute(:status, "Paid with Paypal")
    
  end
  
end
