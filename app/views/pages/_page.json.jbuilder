# frozen_string_literal: true

json.extract! page, :id, :user_id, :title, :slug, :subtitle, :body, :published_at, :archived_at, :created_at,
              :updated_at
json.url page_url(page, format: :json)
json.body page.body.to_s
