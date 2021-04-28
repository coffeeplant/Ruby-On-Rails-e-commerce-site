class UserController < ApplicationController
    
    def login
        session[:login] = 1
        session[:cart] = nil
        flash[:notice] = "Admin Login Successful!"
        redirect_to :controller => :meals
    end
    
    def logout
        session[:login] = nil
        session[:cart] = nil
        flash[:notice] = "Ok then see you next time!"
        redirect_to :controller => :items
    end
    
end
