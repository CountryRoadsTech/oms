# Configures the default database primary key type to be UUIDs
Rails.application.config.generators do |g|
    g.orm :active_record, primary_key_type: :uuid
end
