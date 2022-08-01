# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id           :uuid             not null, primary key
#  archived_at  :datetime
#  external     :boolean          default(TRUE)
#  published_at :datetime
#  slug         :text
#  title        :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :uuid             not null
#
# Indexes
#
#  index_articles_on_slug     (slug) UNIQUE
#  index_articles_on_title    (title) UNIQUE
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_3d31dad1cc  (user_id => users.id)
#
class Article < ApplicationRecord
  self.implicit_order_column = 'created_at'

  belongs_to :user, inverse_of: :articles
  has_rich_text :body

  validates :title, :body, presence: true
  validates :title, uniqueness: true

  scope :only_internal, -> { where(external: false) }
  scope :only_external, -> { where(external: true) }

  scope :published, -> { where('published_at <= ?', Time.current) }
  scope :scheduled_for_publication, -> { where('published_at > ?', Time.current) }
  scope :not_scheduled_for_publication, -> { where(published_at: nil) }

  has_paper_trail # Track and store changes to this model

  include Archivable # Enables soft deleting and restoring this model

  extend FriendlyId # Use an attribute other than ID in the URL slug
  friendly_id :title, use: :history

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
