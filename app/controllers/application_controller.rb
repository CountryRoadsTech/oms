class ApplicationController < ActionController::Base
    # Enables protection from cross-site request forgery (CSRF) attacks
    protect_from_forgery with: :exception

    # Enables pagination methods in controllers
    include Pagy::Backend
end
