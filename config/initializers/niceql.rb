# frozen_string_literal: true

Niceql.configure do |c|
  # You can adjust pg_adapter in prooduction at your own risk!
  # If you need it in production use exec_niceql
  # default: false
  c.pg_adapter_with_nicesql = false

  # c.indentation_base = 2
  # c.open_bracket_is_newliner = false
  c.prettify_active_record_log_output = true
end
