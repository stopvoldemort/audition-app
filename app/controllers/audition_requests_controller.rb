class AuditionRequestsController < ApplicationController
  before_action :set_audition_request, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :require_studio_id, only: [:new, :create, :destroy]


  # GET /audition_requests
  def index
    @outstanding_audition_requests = AuditionRequest.all.select do |ar|
      ar.actor_id == session[:id] && ar.accepted == nil
    end
    @accepted_audition_requests = AuditionRequest.all.select do |ar|
      ar.actor_id == session[:id] && ar.accepted == true
    end
    @actor = User.find(session[:id])
  end

  def new
    @audition_request = AuditionRequest.new
  end

  def create
    @audition_request = AuditionRequest.new(audition_request_params)
    if @audition_request.save
      redirect_to @audition_request, notice: 'Audition request was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /audition_requests/1
  # PATCH/PUT /audition_requests/1.json
  def update
  end

  def accept_audtions
    accept_audition_request_params.each do |ar_id|
      @ar = AuditionRequest.find(ar_id)
      @ar.accepted = true
      @ar.save
    end
    redirect_to audition_requests_path
  end

  # DELETE /audition_requests/1
  # DELETE /audition_requests/1.json
  def destroy
    @audition_request.destroy
    respond_to do |format|
      format.html { redirect_to audition_requests_url, notice: 'Audition request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audition_request
      @audition_request = AuditionRequest.find(params[:id])
    end

    def require_login
      redirect_to '/signin' unless session.include? :id
    end

    def require_studio_id
      redirect_to '/signin' unless User.find(session[:id]).is_studio == 1
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audition_request_params
      params.require(:audition_request).permit(:actor_id, :role_id, :accepted)
    end

    def accept_audition_request_params
      params.require(:audition_request_ids)
    end

end
