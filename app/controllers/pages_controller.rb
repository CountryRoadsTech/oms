# frozen_string_literal: true

# Defines which actions are available to pages
class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages or /pages.json
  def index
    @pages = if current_user
               Page.all.with_archived
             else
               Page.published
             end
  end

  # GET /pages/1 or /pages/1.json
  def show
    # Redirect to the latest URL for the record if an old slug was used
    # redirect_to @page, status: :moved_permanently if request.path != page_path(@page)
  end

  # GET /pages/new
  def new
    authenticate_user!

    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
    authenticate_user!
  end

  # POST /pages or /pages.json
  def create
    authenticate_user!

    save_published_at_datetime if params.dig(:page, :published_at_date) || params.dig(:page, :published_at_time)

    @page = Page.new(page_params)
    @page.user = current_user

    respond_to do |format|
      if @page.save
        format.html { redirect_to page_url(@page), notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1 or /pages/1.json
  def update
    authenticate_user!

    save_published_at_datetime if params.dig(:page, :published_at_date) || params.dig(:page, :published_at_time)

    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to page_url(@page), notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1 or /pages/1.json
  def destroy
    authenticate_user!

    @page.archive!

    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully archived.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = if current_user
              Page.with_archived.friendly.find(params[:id])
            else
              Page.published.friendly.find(params[:id])
            end
  rescue ActiveRecord::RecordNotFound
    # Render the 404 page if the record cannot be found with the given slug
    render file: Rails.public_path.join('404.html'), status: :not_found and return
  end

  # Only allow a list of trusted parameters through.
  def page_params
    params.require(:page).permit(:title, :subtitle, :body, :published_at, :published_at_date, :published_at_time)
  end

  def save_published_at_datetime
    date = Time.zone.parse(params.dig(:page, :published_at_date))&.to_date
    time = Time.zone.parse(params.dig(:page, :published_at_time))
    # Remove the old, separate date and time keys
    params[:page].extract!(:published_at_date, :published_at_time)
    # Add the new, combined datetime key
    params[:page][:published_at] = Time.zone.parse("#{date&.strftime('%F')} #{time&.strftime('%T')}")
  end
end
