# frozen_string_literal: true

json.extract! article, :id, :user_id, :title, :slug, :body, :external, :published_at, :archived_at, :created_at,
              :updated_at
json.url article_url(article, format: :json)
json.body article.body.to_s
