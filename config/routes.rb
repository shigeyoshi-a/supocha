Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts, only: [:index, :new, :create, :destroy, :edit, :update, :show] do
    resources :messages, only: [:index, :create, :show, :list]
  end
  resources :users, only: [:index, :new, :create, :destroy, :edit, :update, :show] 
end