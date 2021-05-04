Rails.application.routes.draw do
  resources :categories
  resources :orders do
    resources:orderitems
  end 
  
  devise_for :users do
    resources :orders
  end
  
  get '/paid/:id' => 'static_pages#paid'

  
  get '/checkout' => 'cart#createOrder'

  get 'cart/index'

  resources :meals
  root 'static_pages#home'

  get '/thankyou/:id' => 'static_pages#thankyou'
  
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'

  
  get '/login' => 'user#login'
  get '/logout' => 'user#logout'
  
  get '/clearcart', to: 'cart#clearCart'
  get '/cart' => 'cart#index'
  get '/cart/:id/', to: 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/decrease/:id' => 'cart#decrease'
  
  get 'category/:title', to: 'static_pages#category'
  
  post '/search' => 'meals#search'
  
  root :to => 'site#home'
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
