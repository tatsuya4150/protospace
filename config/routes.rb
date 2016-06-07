Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :users, only: :show

  get  '/prototypes/index'  =>    'prototypes#index'
  get  '/prototypes/new'    =>    'prototypes#new'
  get  '/prototypes/show'   =>    'prototypes#show'
end
