# frozen_string_literal: true

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
require 'rails_helper'

RSpec.describe Page, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
