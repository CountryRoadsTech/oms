# frozen_string_literal: true

# This migration creates pages
class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages, id: :uuid do |t|
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid

      t.text :title, null: false
      t.text :slug
      t.text :subtitle

      t.datetime :published_at
      t.datetime :archived_at
      t.timestamps
    end

    add_index :pages, :title, unique: true
    add_index :pages, :slug, unique: true
  end
end
