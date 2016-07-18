Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :users, only: [:show, :edit, :update]


  resources :prototypes, only: [:index, :new, :show, :create]  do
    scope module: :prototypes do
      resources :likes, only: [:create, :destroy]
    end
  end
end
