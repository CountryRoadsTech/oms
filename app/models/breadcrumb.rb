# frozen_string_literal: true

# Stores where in the website the user is, to display to them
class Breadcrumb
  attr_reader :name, :url

  def initialize(name, url)
    @name = name
    @url = url
  end

  def link?
    @url.present?
  end
end
