# frozen_string_literal: true

require 'sidekiq/web'

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
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }
  as :user do
    get 'users/edit' => 'users/registrations#edit', :as => 'edit_user_registration'
    patch 'users' => 'users/registrations#update', :as => 'user_registration'
  end
  resources :users, only: [:show]

  namespace :admin do
    mount RailsMiniProfiler::Engine => 'requests' if Rails.env.development?
    mount Sidekiq::Web => 'background_jobs' if Rails.env.development?
  end

  # Defines the root path route ("/")
  root 'pages#index'
end
