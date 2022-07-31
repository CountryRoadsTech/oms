# frozen_string_literal: true

# Enables the required Postgresql extension, pg_crypto, needed to use UUIDs
class EnablePostgresUuids < ActiveRecord::Migration[7.0]
  def change
    enable_extension('pgcrypto') unless extension_enabled?('pgcrypto')
  end
end
