class ApplicationController < ActionController::Base
    # Enables protection from cross-site request forgery (CSRF) attacks
    protect_from_forgery with: :exception

    # Enables pagination methods in controllers
    include Pagy::Backend

    # Add helper methods to store which page the user is on and display it to them
    helper_method :breadcrumbs

    def breadcrumbs
      @breadcrumbs ||= []
    end
  
    def add_breadcrumb(name, url = nil)
      breadcrumbs << Breadcrumb.new(name, url)
    end
end
