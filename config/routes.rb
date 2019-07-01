Rails.application.routes.draw do
  get 'releases/index'
  get 'releases/edit'
  get 'releases/show'
  get 'releases/update'
  get 'releases/destroy'
  resources :events do
    collection {post :import}
  end
  root 'home#index_change'
  get 'home/index_change', to: 'home#index_change'
  resources :contacts, only: [:index, :new, :create]
  resources :releases

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
