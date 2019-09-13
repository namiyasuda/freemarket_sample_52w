Rails.application.routes.draw do

  devise_for :users
  namespace :users do
    get 'addresses/new'
    get 'addresses/create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'tops#index'
  resources :tops, only: [:index]

  resources :signup, only: [:new,:index,:create] do
    collection do 
      get 'customer_info'
      get 'sms_comfi'
      get 'address'
      get 'card'
      get 'complete'
    end
    resource :mypage do
      collection do 
        get 'profile'
        get 'logout'
      end
    end
  end

  resources :products, only: [:new]

  devise_scope :user do   
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


end
