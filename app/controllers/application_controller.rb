# frozen_string_literal: true

require 'browser'

# The base application controller
# Everything defined here happens every action or is available to all controllers
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

  # Track and store which user (if signed in) performed each change to a model
  before_action :set_paper_trail_whodunnit

  # Store each request in the database.
  after_action :save_request

  private

  def save_request
    Request.create!({ user: current_user,
                      request_action: request.method,
                      request_url: request.url,
                      request_path: request.path,
                      request_parameters: request.parameters.map(&:to_s).join(', '),
                      ip: request.ip,
                      remote_ip: request.remote_ip,
                      local: request.local?,
                      user_agent: request.user_agent,
                      device: browser.device.name,
                      requests_mobile: request.headers['Sec-CH-UA-Mobile'],
                      os: browser.platform,
                      os_version: browser.platform.version,
                      browser: browser.name,
                      browser_version: browser.full_version,
                      accepts_languages: browser.accept_language.map(&:name).join(', '),
                      referer: request.referer,
                      landing_page: request.original_url,
                      bot: browser.bot?,
                      location: request.location,
                      safe_location: request.safe_location })
  end
end
