# frozen_string_literal: true

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
  end
end
