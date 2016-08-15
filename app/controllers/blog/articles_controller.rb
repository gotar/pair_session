class Blog::ArticlesController < ApplicationController
  before_action :authenticate, except: [:index, :show]

  def index
    @articles = Article.all.order("created_at DESC")
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
     @article = Article.new(article_params)

    if @article.save
      redirect_to blog_articles_path, notice: "Article saved"
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to [:blog, @article], notice: "article updated"
    else
      render 'edit'
    end
  end

  def destroy
  @article = Article.find(params[:id])

  @article.destroy
  redirect_to blog_articles_path, notice: "Article deleted"
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :image)
    end
end
