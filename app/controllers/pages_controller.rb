# frozen_string_literal: true

# Defines which actions are available to pages
class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages or /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1 or /pages/1.json
  def show; end

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
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    # Render the 404 page if the record cannot be found with the given slug
    render file: Rails.public_path.join('404.html'), status: :not_found and return
  end

  # Only allow a list of trusted parameters through.
  def page_params
    params.require(:page).permit(:title, :subtitle, :body, :published_at)
  end
end
