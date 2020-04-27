Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  resources :items do
    member do
      get "new_buy"
    end
  end
end
