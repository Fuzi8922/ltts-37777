Rails.application.routes.draw do
  devise_for :users

  root to: "reviews#index"

  resources :reviews do
    resources :comments,  only: [:create, :destroy]
    resource  :goods,     only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
  end

  resources :users, only: [:show]

end
