class RelationshipsController < ApplicationController
	before_action :signed_in_user

	def create
		@user = User.find(params[:relationship][:followed_id])
		current_user.follow!(@user)
		redirect_to @user
		respond_to do |format| 
			format.html { redirect_to @user}
			format.js
		end
	end

	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow!(@user)
		redirect_to @user
		respond_to do |user|
			format.html { redirect_to @user }
			format.js 
	end

	def signed_in_user
      unless signed_in?        
        stored_location
        redirect_to signin_url, notice: "Please sign in" 
      end
    end
end