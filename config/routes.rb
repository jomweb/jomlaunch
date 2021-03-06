Rails.application.routes.draw do
  devise_for :users
  resources :projects, except: :destroy
  resources :users, except: :destroy
  get 'account', to: 'account#edit',	as: :account
  put 'account', to: 'account#update'
  get 'submit', to: 'home#submit', as: :submit
  post 'submit', to: 'home#submitted'
  root 'home#index'
end
