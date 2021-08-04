Rails.application.routes.draw do
  resources :businesses
  resources :shops
  resources :lists
  
  resources :uploads
  get '/admin' => 'admin#new'
  get '/admin_index' => 'admin#index'
  post '/login' => 'admin#login'
  get '/list'=>'lists#index'
  get 'customer_reg'=>'customer#reg_cust'
  get 'customer'=>'customer#index'
  post 'customer'=>'customer#create'
  post '/session2' => 'session2#create'
  get '/dashboard' => 'dashboard#index'
  get '/shop'=>'shop#index'
  get '/shop_reg'=>'shop#reg_shop'
  get '/' => 'welcome#index'
  post '/shop' => 'shop#create'
  post '/session' => 'session#create'
  get '/medical' => 'medical#index'
  get 'upload' =>'businesses#index'
  get '/out2' =>'session2#destroy'
  get '/out' => 'session#destroy'
  get '/notification' => 'businesses#notification'
  get '/approve/:id' => 'businesses#approve',as:'approve'
  get '/show1/:id' => 'businesses#show1',as:'show1'
  get '/business_edit/:id' => 'businesses#edit',as:'edit_status'
  post '/business_edit' => 'businesses#update'
  get '/choose/:id' => 'businesses#choose',as:'choose'
  get '/index1' => 'businesses#index1'
  get '/show2/:id' => 'businesses#show2',as:'show2'
  get '/list_index' => 'lists#index1'
  get '/edit12/:id'=>'lists#edit1',as:'edit_list1'
  post '/updatelist' => 'lists#update1'
  get '/order_med/' => 'businesses#index2'
  get '/show3/:id' => 'businesses#show3',as:'show3'
  get '/show3/:id/download' => 'businesses#download',as:'download'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
