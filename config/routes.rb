Rails.application.routes.draw do
  resources :sizes
  resources :categories
  resources :orders do
    resources:orderitems
  end 
  
  devise_for :users do
    resources :orders
  end
  
  get '/paid/:id' => 'static_pages#paid'

  get '/checkout' => 'cart#createOrder'
  get '/ordercomplete' => 'cart#ordercomplete'
  get 'cart/index'

  resources :meals
  root 'static_pages#home'

  get '/thankyou/:id' => 'static_pages#thankyou'
  
  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  get '/admin' => 'static_pages#admin'
  get '/contact' => 'static_pages#contact'
  get '/allusers' => 'static_pages#allusers'
  get '/adminorders' => 'static_pages#adminorders'
  get '/adminmeals' => 'static_pages#adminmeals'
  get '/profile' => 'static_pages#profile'
  get '/prefmeat/:id' => 'static_pages#meat'
  get '/prefvegetarian/:id' => 'static_pages#vegetarian'
  get '/prefvegan/:id' => 'static_pages#vegan'
  get '/allergenwheat/:id'=> 'static_pages#wheat'
  get '/allergennut/:id' => 'static_pages#nut'
  get '/allergenegg/:id' => 'static_pages#egg'



  
  get '/login' => 'user#login'
  get '/logout' => 'user#logout'
  get '/upgrade/:id' => 'static_pages#upgrade'
  get '/downgrade/:id' => 'static_pages#downgrade'
  
  get '/clearcart', to: 'cart#clearCart'
  get '/cart' => 'cart#index'
  get '/cart/:id/', to: 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/decrease/:id' => 'cart#decrease'
  get '/cart/increase/:id' => 'cart#increase'
  
  get 'category/:title', to: 'static_pages#category'
  
  post '/search' => 'meals#search'
  post '/mymeals/:id' => 'meals#mymeals'

  
  root :to => 'site#home'
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
