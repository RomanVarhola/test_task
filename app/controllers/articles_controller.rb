class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, only: %i(show update edit destroy)
  
  def show
    @user = @article.user
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to root_path, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to root_path, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def find_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :avatar)
    end
end
