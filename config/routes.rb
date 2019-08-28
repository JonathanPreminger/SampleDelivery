Rails.application.routes.draw do
  get 'dj_set_validates/valid'
  get 'dj_sets/create'
  devise_for :users
  resources :events do
    collection do
      post :import
      get :calendar
    end
  end
  root 'home#index_change'
  get 'home/index_change', to: 'home#index_change'

  get 'home/private'
  resources :contacts, only: [:index, :new, :create]
  resources :realreleases
  resources :artists
  resources :djsets 
  resources :tracks
  resources :articles



end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
