Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/new'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create]
  
end
