Rails.application.routes.draw do
  devise_for :users
  root 'items#top'

  resources :items do
    resources :favourites, only: [:create, :destroy]
  end
end
