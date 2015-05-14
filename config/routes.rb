Rails.application.routes.draw do
  resources :users, only: [:show, :create, :new]
  resource :sessions, only: [:create, :destroy, :new]
end
