Rails.application.routes.draw do
  get 'events/index'
  get 'events/import'
  get 'events/edit'
  get 'events/update'
  get 'events/destroy'
  get 'events/event_params'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
