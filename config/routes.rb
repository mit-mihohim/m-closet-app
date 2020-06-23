Rails.application.routes.draw do
  devise_for :users
  root 'items#top'

  resources :items do
    resources :favourites, only: [:index, :create, :destroy]
  end
end
