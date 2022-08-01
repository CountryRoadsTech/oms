# frozen_string_literal: true

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'users/show'
  # Creates RESTful routes
  resources :pages, :articles

  # Enables viewing pages without needing to have pages/ first
  get '/:id' => 'pages#show'

  # Adds user authentication routes
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }
  resources :users, only: [:show]

  namespace :admin do
    mount RailsMiniProfiler::Engine => 'requests' if Rails.env.development?
    mount GoodJob::Engine => 'background_jobs' if Rails.env.development?
  end

  # Defines the root path route ("/")
  root 'pages#index'
end
