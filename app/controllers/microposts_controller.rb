class MicropostsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]

 	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Micropost Created!"
			redirect_to root_url
		else
			render 'staticpages/home'
		end
	end

	def destroy
	end

	private

	def micropost_params
		params.require(:micropost).permit(:content)
	end

	def signed_in_user
      unless signed_in?        
        stored_location
        redirect_to signin_url, notice: "Please sign in" 
      end
    end
end