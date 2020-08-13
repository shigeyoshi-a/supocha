class UsersController < ApplicationController

  def show
    @user = User.find(params[:id]) 
    @nickname = @user[:nickname]
    @posts = @user.posts.order("created_at DESC")
  end

  def edit
    @user = User.find(params[:id]) 
  end
  
  def update
    user = User.find(params[:id]) 
    current_user.update(user_params)
    redirect_to "/users/#{current_user.id}"
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :sex, :ago, :info, :image)
  end

end