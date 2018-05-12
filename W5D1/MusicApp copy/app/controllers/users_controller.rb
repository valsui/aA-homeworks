class UsersController < ApplicationController

#sign up page
  def new
    @user = User.new
    render :new
  end

#make new user
  def create
    @user = User.new(user_params)

    if @user.save
      login(@user) #need this in ApplicationController
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

#show user
  def show
    @user = User.find(params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
