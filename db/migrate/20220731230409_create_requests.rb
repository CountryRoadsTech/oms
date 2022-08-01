# frozen_string_literal: true

# This migraiton creates requests which are used to store every request to the server
class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests, id: :uuid do |t|
      t.belongs_to :user, foreign_key: true, type: :uuid

      t.text :controller_class
      t.text :controller_method
      t.text :request_action
      t.text :request_url
      t.text :request_path
      t.text :request_parameters
      t.uuid :request_id
      t.text :ip
      t.text :remote_ip
      t.boolean :local
      t.text :user_agent
      t.text :device
      t.boolean :requests_mobile
      t.text :os
      t.text :os_version
      t.text :browser
      t.text :browser_version
      t.text :accepts_languages
      t.text :referer
      t.text :landing_page
      t.boolean :bot
      t.text :location
      t.text :safe_location
      t.text :country
      t.decimal :latitude
      t.decimal :longitude
      t.text :http_status
      t.text :format

      t.datetime :started_at
      t.datetime :created_at
    end
  end
end
