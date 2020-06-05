Rails.application.routes.draw do
  match "/404", :to => 'errors#not_found', :via => :all
  match "/500", :to => 'errors#internal_server_error', :via => :all
  get 'dj_set_validates/valid'
  get 'dj_sets/create'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :events do
    collection do
      post :import
      get :calendar
    end
  end
  root 'articles#index'
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
