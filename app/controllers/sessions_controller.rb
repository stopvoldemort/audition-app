class SessionsController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user == nil || !@user.authenticate(params[:password])
      redirect_to '/signin', notice: 'You have entered an incorrect email or password'
    else
      session[:id] = @user.id
      redirect_to productions_path if @user.is_studio == 1
      redirect_to audition_requests_path if @user.is_studio == 0
    end
  end

  def destroy
    session.delete :id
    redirect_to '/signin'
  end

end
