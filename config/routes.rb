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

  resources :users do
    resource :mypage do
      collection do 
        get 'profile'
        get 'logout'
        get 'personal_info'
      end
    end
  end

  resources :products, only: [:new]

  devise_scope :user do   
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


end
