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
  get '/prefclear/:id' => 'static_pages#prefclear'
  get '/allergenwheat/:id'=> 'static_pages#wheat'
  get '/allergennut/:id' => 'static_pages#nut'
  get '/allergenegg/:id' => 'static_pages#egg'
  get '/allergenclear/:id' => 'static_pages#allergenclear'



  
  get '/login' => 'user#login'
  get '/logout' => 'user#logout'
  get '/upgradeadmin/:id' => 'static_pages#upgradeadmin'
  get '/downgradeadmin/:id' => 'static_pages#downgradeadmin'
  get '/upgradestaff/:id' => 'static_pages#upgradestaff'
  get '/downgradestaff/:id' => 'static_pages#downgradestaff'
  
  get '/clearcart', to: 'cart#clearCart'
  get '/cart' => 'cart#index'
  get '/cart/:id/', to: 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/decrease/:id' => 'cart#decrease'
  get '/cart/increase/:id' => 'cart#increase'
  
  get 'category/:title', to: 'static_pages#category'
  
  post '/search' => 'meals#search'
  post '/deliveryname' => 'static_pages#deliveryname'
  post '/deliveryaddress' => 'static_pages#deliveryaddress'
  post '/deliveryphone' => 'static_pages#deliveryphone'
  post '/mymeals/:id' => 'meals#mymeals'

  
  root :to => 'site#home'
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
