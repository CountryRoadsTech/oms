# frozen_string_literal: true

# == Schema Information
#
# Table name: login_activities
#
#  id             :bigint           not null, primary key
#  city           :string
#  context        :string
#  country        :string
#  failure_reason :string
#  identity       :string
#  ip             :string
#  latitude       :float
#  longitude      :float
#  referrer       :text
#  region         :string
#  scope          :string
#  strategy       :string
#  success        :boolean
#  user_agent     :text
#  user_type      :string
#  created_at     :datetime
#  request_id     :text
#  user_id        :bigint
#
# Indexes
#
#  index_login_activities_on_identity  (identity)
#  index_login_activities_on_ip        (ip)
#  index_login_activities_on_user      (user_type,user_id)
#
class LoginActivity < ApplicationRecord
  self.implicit_order_column = 'created_at'

  belongs_to :user, polymorphic: true, optional: true
end
