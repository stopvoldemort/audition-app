class ProductionsController < ApplicationController
  before_action :set_production, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :require_studio_id

  def index
    @user = User.find(session[:id])
    if @user.is_studio
      @productions = @user.productions
    else
      @productions = @user.actor_productions
    end
  end

  def show
  end

  # GET /productions/new
  def new
    @production = Production.new
  end

  # GET /productions/1/edit
  def edit
    set_production
  end

  # POST /productions
  # POST /productions.json
  def create
    @production = Production.new(production_params)
    @production.studio = User.find(session[:id])
    if @production.save
      redirect_to @production, notice: 'Production was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /productions/1
  # PATCH/PUT /productions/1.json
  def update
    if @production.update(production_params)
     redirect_to @production, notice: 'Production was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /productions/1
  # DELETE /productions/1.json
  def destroy
    @production.destroy
    redirect_to productions_url, notice: 'Production was successfully destroyed.'
  end

  def assign_auditions
    @production = set_production
    @actors = @production.check_date_overlaps
  end

  def post_audition_requests
    @production = set_production
    @production.send_audition_request(params)
    redirect_to @production
  end

  def assign_roles
    @production = set_production
    @actors = @production.check_date_overlaps
  end

  def post_assign_roles
    @production = set_production
    @production.update_role(params)
    redirect_to @production
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production
      @production = Production.find(params[:id])
    end

    def require_login
      redirect_to '/signin' unless session.include? :id
    end

    def require_studio_id
      redirect_to '/signin' unless User.find(session[:id]).is_studio == 1
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def production_params
      params.require(:production).permit(:title, :production_type, :budget, :date_begin, :date_end, :studio_id)
    end
end
