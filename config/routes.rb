Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'surveys#index'

  resources :surveys,   only: [:index, :new, :create]
  resources :questions, only: [:index, :new, :create]
  resources :choices,   only: [:index]
  get 'choose', to: 'choices#choose'
end
