Rails.application.routes.draw do
  get 'respondents/new'

  get 'num_ranges/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'surveys#index'

  resources :surveys,   only: [:index, :new, :create, :destroy]
  resources :questions
  resources :num_ranges
  resources :choices,   only: [:index]
  resources :response_options, only: [:new, :create, :edit, :update]
  resources :respondents, only: [:index, :new, :create]
  resources :results, only: [:show]
  get 'choose', to: 'choices#choose'
end
