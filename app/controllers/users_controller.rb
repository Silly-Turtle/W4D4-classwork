class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def show
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_url

    else
      flash.now[:errors] = ['User information not acceptable']
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
