require 'article/article_cached'

class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    @articles = ArticleCached.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = ArticleCached.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = ArticleCached.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = ArticleCached.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = ArticleCached.new(params[:article])

    respond_to do |format|
      if @article.save
        ArticleCached.clear_cached_articles

        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = ArticleCached.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        ArticleCached.clear_cached_articles

        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = ArticleCached.find(params[:id])
    @article.destroy

    ArticleCached.clear_cached_articles

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
