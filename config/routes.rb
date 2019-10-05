Rails.application.routes.draw do

  devise_for :users, :controllers => {
    omniauth_callbacks:  "users/omniauth_callbacks",
    sessions: "users/sessions"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'tops#index'
  resources :tops, only: [:index]

  resources :delivery_addresses, only: [:new, :create, :update]
  resources :cards, only: [:new, :show,:create, :destroy]
  resources :signup, only: [:new, :create] do
    collection do 
      get 'customer_info'
      get 'sms_comfi'
      get 'complete'
    end
  end

  resources :products, only: [:show, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
      get 'get_delivery_method', defaults: { format: 'json' }
      get 'dropzone'
      patch ':id/stop_listing', to: 'products#stop_listing'
      patch ':id/restart_listing', to: 'products#restart_listing'
    end
    resource :buys, only: [:show] do
      collection do
        patch 'pay'
      end
    end
  end  
  
  resources :users, only: [:update] do
    resource :mypage, only: [:show] do
      collection do 
        get 'profile'
        get 'logout'
        get 'personal_info'
        get 'payment'
        get 'card_reg'
        get 'card_show'
        post 'create_card'
        post 'personal_info' => 'mypages#create_user_address'
        get 'listing_product'
        get 'delivery_address'
        get 'during_trade'
        get 'sold'
        get 'bought_product'
        get 'past_trade'
      end
    end
  end

  resources :user_addresses, only: [:update]

  devise_scope :user do   
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :auth_signup, only: [:create] do
    collection do 
      get 'auth_sms_comfi'
    end
  end

end
