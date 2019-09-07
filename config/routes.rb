Rails.application.routes.draw do

  devise_for :users
  namespace :users do
    get 'addresses/new'
    get 'addresses/create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tops, only: [:index]
  resources :users, only: [:new,:index] do
    collection do 
      get 'address'
      get 'customer_info'
      get 'sms_comfi'
      get 'card'
      get 'complete'
    end
    resource :mypage
  end

  resources :products, only: [:new]

end
