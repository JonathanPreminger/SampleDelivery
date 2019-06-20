Rails.application.routes.draw do
  resources :events do
    collection {post :import}
  end

  root 'home#index_change'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
