Rails.application.routes.draw do

  devise_for :users
  resources :events do
    collection {post :import}
  end
  root 'home#index_change'
  get 'home/index_change', to: 'home#index_change'
  get 'home/private'
  resources :contacts, only: [:index, :new, :create]
  resources :realreleases
  resources :artists
  resources :tracks

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
