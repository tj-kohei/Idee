Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :profiles, only: [:show, :edit, :update]
  resources :ideas, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :reviews, only: [:create, :destroy]
  end
end
