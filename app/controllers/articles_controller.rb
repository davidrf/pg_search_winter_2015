class ArticlesController < ApplicationController
  def index
    @articles = Article.search(params[:query])
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article saved!"
      redirect_to articles_url
    else
      flash.now[:alert] = "Article not saved!"
      @articles = Article.all
      render :index
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
