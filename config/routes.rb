Rails.application.routes.draw do

  ### USER AUTH ###
  resources :users, only: [:show, :create, :new]
  resource :sessions, only: [:create, :destroy, :new]


  ### MUSIC APP ###
  resources :bands do
    resources :albums, only: :index
  end

  resources :albums, except: :index do
    resources :tracks, only: :index
  end

  resources :tracks, except: :index
end
