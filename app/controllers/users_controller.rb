class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show  	 
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user

  	else
  		render 'new'
  	end
  end

  def edit   
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile Updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def signed_in_user
      unless signed_in?        
        stored_location
        redirect_to signin_url, notice: "Please sign in" 
      end
    end

    def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to root_url, notice: "Unauthorize to edit user details" unless current_user?(@user)
    end
end
