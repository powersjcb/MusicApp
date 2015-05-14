class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      login_params[:email],
      login_params[:password]
    )
    if !!@user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      # flash[:errors] = "Invalid login credentials"
      @user = User.new(login_params[:email])
      render :new
    end
  end

  def destroy
    log_out
    redirect_to new_sessions_url
  end

  def new
    @user = User.new

  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end

end
