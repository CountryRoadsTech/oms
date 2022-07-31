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
require 'rails_helper'

RSpec.describe Request, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
