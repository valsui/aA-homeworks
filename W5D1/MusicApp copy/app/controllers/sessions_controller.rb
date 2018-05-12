class SessionsController < ApplicationController

  #sign in
  def new
    @user = User.new
    render :new
  end

  #
  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if @user
      login(@user) #in ApplicationController, will set the session token
      redirect_to user_url(@user)
    else
      flash[:errors] = ['You are wrong']
      redirect_to new_session_url
    end
  end

  def destroy
    logout # in ApplicationController - will have access to the current user already
    redirect_to new_session_url
  end
end
