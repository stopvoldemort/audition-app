class RolesController < ApplicationController

  def new
    @role = Role.new(production_id: params[:id])
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to production_path(@role.production)
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def role_params
    params.require(:role).permit(:production_id, :name, :description)
  end

end
