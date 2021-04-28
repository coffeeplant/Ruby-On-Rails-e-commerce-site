Rails.application.routes.draw do
  get 'cart/index'

  resources :meals
  root 'static_pages#home'

  get '/help' => 'static_pages#help'

  get '/about' => 'static_pages#about'
  
  get '/login' => 'user#login'
  
  get '/logout' => 'user#logout'
  
  get '/cart' => 'cart#index'
  
  get '/cart/:id', to: 'cart#add'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
