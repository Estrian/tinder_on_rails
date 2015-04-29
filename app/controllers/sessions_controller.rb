class SessionsController < ApplicationController
  def new
    redirect_to root_path, notice: "You're already signed in" if session[:signed_in]
  end

  def create
    @user = User.find_by(email: params['login']['email'])

    if @user && params['login']['password'] == @user.password
      session[:signed_in] = @user.id
      redirect_to root_path, notice: 'Successfully signed in'
    else
      flash[:alert] = 'Incorrect email or password'
      render :new
    end
  end

  def destroy
    redirect_to root_path, notice: "You're not signed in" unless session[:signed_in]
    session[:signed_in] = nil
    redirect_to root_path, notice: "You've successfully signed out"
  end
end