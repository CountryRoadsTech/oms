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
FactoryBot.define do
  factory :article do
    user
    title { Faker::Lorem.unique.sentence }
    body { Faker::Lorem.paragraphs(number: 5, supplemental: true).join("\n\n") }
  end
end
