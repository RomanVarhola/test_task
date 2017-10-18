class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :find_user, only: %i(following followers show)

	def index
		@users = User.all
	end

	def show
		@articles = @user.articles	
	end

	def feed
		@users = current_user.followed_users
		@articles = Article.where(user_id: @users).order(:created_at)
	end

	def my_profile
		@user = current_user
		@articles = @user.articles
	end

	def following
    @title = "Following"
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
   	@title = "Followers"
    @users = @user.followers
    render 'show_follow'
  end

	private
	
		# Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,:first_name,:last_name, :avatar)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
