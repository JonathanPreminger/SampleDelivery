class ArticlesController < ApplicationController

  def create
  article = Article.create(article_params)
    if article.save
      respond_to do |format|
        format.html do
          flash[:success] = "Article created"
          redirect_to articles_path
        end
        format.json do
          render json: article
        end
      end

    else
      flash[:error] = "failed niga"
      redirect_to articles_path
    end
  end

  def new
    @article = Article.new(params[:article])
      @articles = Article.all
  end

  def index
    @articles = Article.all
    respond_to do |format|
      format.html do
      end
      format.json do
        render json: @articles
      end
    end
  end

  def edit
     @article = Article.find(params[:id])
  end

  def show
     @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    flash[:notice] = "#{@article.title} was successfully updated."
    redirect_to articles_path
  end

  def destroy
    Article.find(params[:id]).destroy
     flash[:success] = "article deleted"
     redirect_to articles_url
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
