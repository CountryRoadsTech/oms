# frozen_string_literal: true

# == Schema Information
#
# Table name: requests
#
#  id                 :uuid             not null, primary key
#  accepts_languages  :text
#  bot                :boolean
#  browser            :text
#  browser_version    :text
#  controller_class   :text
#  controller_method  :text
#  country            :text
#  device             :text
#  format             :text
#  http_status        :text
#  ip                 :text
#  landing_page       :text
#  latitude           :decimal(, )
#  local              :boolean
#  location           :text
#  longitude          :decimal(, )
#  os                 :text
#  os_version         :text
#  referer            :text
#  remote_ip          :text
#  request_action     :text
#  request_parameters :text
#  request_path       :text
#  request_url        :text
#  requests_mobile    :boolean
#  safe_location      :text
#  started_at         :datetime
#  user_agent         :text
#  created_at         :datetime
#  request_id         :uuid
#  user_id            :uuid
#
# Indexes
#
#  index_requests_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_8ead8b1e6b  (user_id => users.id)
#
FactoryBot.define do
  factory :request do
    user { nil }
    controller_class { 'MyText' }
    controller_method { 'MyText' }
    request_action { 'MyText' }
    request_url { 'MyText' }
    request_path { 'MyText' }
    request_parameters { 'MyText' }
    request_id { '' }
    ip { 'MyText' }
    remote_ip { 'MyText' }
    local { false }
    user_agent { 'MyText' }
    device_type { 'MyText' }
    device { 'MyText' }
    requests_mobile { false }
    os { 'MyText' }
    os_version { 'MyText' }
    browser { 'MyText' }
    browser_version { 'MyText' }
    accepts_languages { 'MyText' }
    referrer { 'MyText' }
    langing_page { 'MyText' }
    bot { false }
    location { 'MyText' }
    country { 'MyText' }
    latitude { '9.99' }
    longitude { '9.99' }
    http_status { 'MyText' }
    format { 'MyText' }
    view_time { '9.99' }
    database_time { '9.99' }
    total_time { '9.99' }
    started_at { '2022-07-31 19:04:09' }
    created_at { '2022-07-31 19:04:09' }
  end
end
