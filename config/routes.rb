Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'tops#index'
  resources :tops, only: [:index]

  resources :addresses, only: [:new,:create]
  resources :card, only: [:new,:show,:create]
  resources :signup, only: [:new,:index,:create] do
    collection do 
      get 'customer_info'
      get 'sms_comfi'
      get 'address'
      get 'card'
      get 'complete'
    end
  end

  resources :products, only: [:show, :new, :create, :edit, :update, :destroy] do
    # Ajaxで動作するルーティングを設定
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
      get 'get_delivery_method', defaults: { format: 'json' }
      get 'dropzone'
    end
  end
  
  resources :users do
    resource :mypage do
      collection do 
        get 'profile'
        get 'logout'
        get 'personal_info'
      end
    end
  end


  devise_scope :user do   
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


end
