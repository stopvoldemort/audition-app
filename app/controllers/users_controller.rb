class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:edit, :update, :show, :destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.actors
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to productions_path if @user.is_studio == 1
      redirect_to '/actor_details' if @user.is_studio == 0
    else
      render :new
    end
  end

  def actor_details
    @user = User.find(session[:id])
  end

  def set_actor_details
    @user = User.find(session[:id])
    @user.update(user_params)
    redirect_to audition_requests_path
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def require_login
      redirect_to '/signin' unless session.include? :id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :email, :is_studio, :base_salary, :bio, :headshot, :remote_headshot_url)
    end
end
