Rails.application.routes.draw do
  devise_for :users
  root 'items#top'

  resources :items

  resources :categories, only: :index do
    collection do
      get "children_categories"
      get "grandchildren_categories"
    end
  end
end
