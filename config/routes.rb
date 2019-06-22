Rails.application.routes.draw do
  resources :events do
    collection {post :import}
  end
  root 'contacts#index'
  resources :contacts, only: [:index, :new, :create]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
