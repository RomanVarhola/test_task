class UsersController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@articles = @user.articles	
	end

	def feed
		@user = current_user
		@users = @user.followed_users
		@articles = Article.where(:user_id => @users).order(:created_at)
	end

	def my_profile
		@user = current_user
		@articles = @user.articles
	end

	def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users#.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
   	@title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers#.paginate(page: params[:page])
    render 'show_follow'
  end

	
	
  private
	
		# Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email,:first_name,:last_name, :avatar)
    end

end
