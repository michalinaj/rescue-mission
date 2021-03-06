Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users
  resources :questions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :answers, only: [:index, :show, :new, :create]
  end
  # resources :answers, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
