# frozen_string_literal: true

# Defines which actions are available to users
class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # Render the 404 page if the record cannot be found with the given slug.
    render file: Rails.public_path.join('404.html'), status: :not_found and return
  end
end
