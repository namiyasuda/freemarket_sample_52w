Rails.application.routes.draw do

  devise_for :users
  namespace :users do
    get 'addresses/new'
    get 'addresses/create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tops, only: [:index]
  resources :signup, only: [:new,:index,:create] do
    collection do 
      get 'customer_info'
      get 'sms_comfi'
      get 'address'
      get 'card'
      get 'complete'
    end
  end

  resources :users, only: [:update] do
    resource :mypage, only: [:show] do
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
