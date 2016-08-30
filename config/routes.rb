Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'surveys#index'

  resources :surveys, only: [:index, :new, :create] do
    resources :questions, only: [:new, :create, :index]
    resources :question_types, only: [:new]
    resources :multiple_choices, only: [:new]
    resources :multiples, only: [:new]
  end
end
