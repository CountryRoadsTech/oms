# frozen_string_literal: true

AuthTrail.geocode = true
AuthTrail.job_queue = :default

AuthTrail.transform_method = lambda do |data, request|
  data[:request_id] = request.request_id
  data[:user] ||= User.find_by(email: data[:identity])
end
