Rails.application.routes.draw do
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


  
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  
  get '/login' => 'user#login'
  get '/logout' => 'user#logout'
  
  get '/clearcart', to: 'cart#clearCart'
  get '/cart' => 'cart#index'
  get '/cart/:id', to: 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/decrease/:id' => 'cart#decrease'
  
  root :to => 'site#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
