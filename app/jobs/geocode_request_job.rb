# frozen_string_literal: true

require 'net/http'
require 'uri'

# This job gets the best known location for a request's IP address
class GeocodeRequestJob < ApplicationJob
  queue_as :default

  def perform(request)
    results = Geocoder.search(request.remote_ip)
    request.location = results.first.address
    request.country = results.first.country
    request.latitude = results.first.coordinates.first
    request.longitude = results.first.coordinates.second
    request.save!

    # Check in with Honeybadger to let it know the job queue is still up and running jobs..
    uri = URI.parse(Rails.application.credentials.honeybadger.sidekiq_checkin_url)
    Net::HTTP.get_response(uri)
  end
end
