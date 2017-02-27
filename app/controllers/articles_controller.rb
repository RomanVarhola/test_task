class ArticlesController < ApplicationController
  before_action :load_article, except: [:new, :create, :show]
  before_action :authenticate_user!
  before_action :load_user, only: [:create, :update, :destroy]

  
  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @user = User.find(@article.user_id)
    @comment = Comment.new
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = @user.articles.new(article_params)

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

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
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

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :avatar)
    end

    def load_user
      authenticate_user!
      @user = current_user
    end
end
