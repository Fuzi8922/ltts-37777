Rails.application.routes.draw do
  devise_for :users

  root to: "reviews#index"

  resources :reviews do
    resources :comments, only: [:create, :destroy]
    resources :goods,    only: [:create, :destroy]
  end

end
