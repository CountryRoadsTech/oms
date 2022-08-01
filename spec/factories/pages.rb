# frozen_string_literal: true

require 'faker'

# == Schema Information
#
# Table name: pages
#
#  id           :uuid             not null, primary key
#  archived_at  :datetime
#  published_at :datetime
#  slug         :text
#  subtitle     :text
#  title        :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :uuid             not null
#
# Indexes
#
#  index_pages_on_slug     (slug) UNIQUE
#  index_pages_on_title    (title) UNIQUE
#  index_pages_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_84a58494eb  (user_id => users.id)
#
FactoryBot.define do
  factory :page do
    user
    title { Faker::Lorem.unique.sentence }
    subtitle { Faker::Lorem.sentences(number: 2).join(' ') }
    body { Faker::Lorem.paragraphs(number: 5, supplemental: true).join("\n\n") }
  end
end
