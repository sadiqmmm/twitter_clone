class StaticpagesController < ApplicationController
 
  def home
    @micropost = current_user.microposts.build if signed_in?
  end

  def help
  end

  def contact
  end

  def about
  end
end
