# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  name                   :text             not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  slug                   :text
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_name                  (name) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are: :registerable, :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  self.implicit_order_column = 'created_at'

  has_many :login_activities, as: :user, dependent: :nullify
  has_many :requests, dependent: :nullify
  has_many :pages, dependent: :nullify, inverse_of: :user
  has_many :articles, dependent: :nullify, inverse_of: :user

  has_rich_text :profile

  validates :name, :profile, presence: true
  validates :name, uniqueness: true

  has_paper_trail # Track and store changes to this model

  extend FriendlyId # Use an attribute other than ID in the URL slug
  friendly_id :name, use: :history

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
