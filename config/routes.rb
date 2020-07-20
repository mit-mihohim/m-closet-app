Rails.application.routes.draw do
  devise_for :users
  root 'items#top'

  resources :items do
    resource :favourites, only: [:create, :destroy]
    collection do
      get "favourites"
      get "unfavourites"
    end
  end
  resources :tags, only: :index do
    collection do
      get "search"
    end
  end
end
