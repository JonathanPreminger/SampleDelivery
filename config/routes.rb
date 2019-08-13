Rails.application.routes.draw do
  devise_for :users
  resources :events do
    collection {post :import}
  end
  root 'articles#index'
  get 'home/index_change', to: 'home#index_change'
  get 'home/private'
  resources :contacts, only: [:index, :new, :create]
  resources :realreleases
  resources :artists
  resources :tracks
  resources :articles


end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
