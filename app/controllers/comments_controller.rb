class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, only: %i(edit destroy)
  before_action :find_article, only: %i(edit create destroy)

  def edit
  end

  def create
    @comment = @article.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to article_path(@article), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to article_path(@article) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to article_path(@article), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_path(@article), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def find_comment
      @comment = Comment.find(params[:id])
    end

    def find_article
      @article = Article.find(params[:article_id])
    end

    def comment_params
      params.require(:comment).permit(:description, :user_id)
    end
end
