# frozen_string_literal: true

# Defines which actions are available to articles
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles or /articles.json
  def index
    @articles = if current_user
                  Article.all.with_archived
                else
                  Article.published
                end
  end

  # GET /articles/1 or /articles/1.json
  def show
    # Redirect to the latest URL for the record if an old slug was used
    redirect_to @article, status: :moved_permanently if request.path != article_path(@article)
  end

  # GET /articles/new
  def new
    authenticate_user!

    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    authenticate_user!
  end

  # POST /articles or /articles.json
  def create
    authenticate_user!

    save_published_at_datetime if params.dig(:article, :published_at_date) || params.dig(:article, :published_at_time)

    @article = Article.new(article_params)
    @article.user = current_user

    respond_to do |format|
      if @article.save
        format.html { redirect_to article_url(@article), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    authenticate_user!

    save_published_at_datetime if params.dig(:article, :published_at_date) || params.dig(:article, :published_at_time)

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    authenticate_user!

    @article.archive!

    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully archived.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = if current_user
                 Article.with_archived.friendly.find(params[:id])
               else
                 Article.published.friendly.find(params[:id])
               end
  rescue ActiveRecord::RecordNotFound
    # Render the 404 page if the record cannot be found with the given slug
    render file: Rails.public_path.join('404.html'), status: :not_found and return
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :body, :external, :published_at, :published_at_date, :published_at_time)
  end

  def save_published_at_datetime
    date = Time.zone.parse(params.dig(:article, :published_at_date))&.to_date
    time = Time.zone.parse(params.dig(:article, :published_at_time))
    # Remove the old, separate date and time keys
    params[:article].extract!(:published_at_date, :published_at_time)
    # Add the new, combined datetime key
    params[:article][:published_at] = Time.zone.parse("#{date&.strftime('%F')} #{time&.strftime('%T')}")
  end
end
