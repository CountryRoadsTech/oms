# frozen_string_literal: true

# This migration creates articles
class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.text :title, null: false
      t.text :slug

      t.boolean :external, default: true

      t.datetime :published_at
      t.datetime :archived_at
      t.timestamps
    end

    add_index :articles, :title, unique: true
    add_index :articles, :slug, unique: true
  end
end
