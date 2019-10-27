Rails.application.routes.draw do
  
  devise_for :users, :controllers => {
    omniauth_callbacks:  "users/omniauth_callbacks",
    sessions: "users/sessions"
  }
  devise_scope :user do   
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root 'tops#index'
 
  # トップページ
  resources :tops, only: [:index] do
    collection do
      get 'search'
    end
  end

  # ユーザー関連
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
        get 'todo'
      end
    end
  end

  resources :auth_signup, only: [:create] do
    collection do 
      get 'auth_sms_comfi'
    end
  end
  
  resources :signup, only: [:new, :create] do
    collection do 
      get 'customer_info'
      get 'sms_comfi'
      get 'complete'
    end
  end

  resources :user_addresses, only: [:update]
  resources :delivery_addresses, only: [:new, :create, :update]
  resources :cards, only: [:new, :show,:create, :destroy]


  # 商品関連
  resources :products, only: [:show, :new, :create, :edit, :update, :destroy] do
    # Ajaxで動作するルーティングを設定
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
      get 'get_delivery_method', defaults: { format: 'json' }
      get 'dropzone'
      patch ':id/stop_listing' => 'products#stop_listing'
      patch ':id/restart_listing' => 'products#restart_listing'
    end
    member do
      get 'evaluation'
      patch 'evaluate'
    end
    resource :buys, only: [:show] do
      collection do
        patch 'pay'
      end
    end
  end  

end
