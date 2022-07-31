# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :admin do
    mount RailsMiniProfiler::Engine => 'requests' if Rails.env.development?
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
