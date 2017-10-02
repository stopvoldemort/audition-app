class AuditionRequestsController < ApplicationController
  before_action :set_audition_request, only: [:show, :edit, :update, :destroy]

  # GET /audition_requests
  # GET /audition_requests.json
  def index
    @audition_requests = AuditionRequest.all
  end

  # GET /audition_requests/1
  # GET /audition_requests/1.json
  def show
  end

  # GET /audition_requests/new
  def new
    @audition_request = AuditionRequest.new
  end

  # GET /audition_requests/1/edit
  def edit
  end

  # POST /audition_requests
  # POST /audition_requests.json
  def create
    @audition_request = AuditionRequest.new(audition_request_params)

    respond_to do |format|
      if @audition_request.save
        format.html { redirect_to @audition_request, notice: 'Audition request was successfully created.' }
        format.json { render :show, status: :created, location: @audition_request }
      else
        format.html { render :new }
        format.json { render json: @audition_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audition_requests/1
  # PATCH/PUT /audition_requests/1.json
  def update
    respond_to do |format|
      if @audition_request.update(audition_request_params)
        format.html { redirect_to @audition_request, notice: 'Audition request was successfully updated.' }
        format.json { render :show, status: :ok, location: @audition_request }
      else
        format.html { render :edit }
        format.json { render json: @audition_request.errors, status: :unprocessable_entity }
      end
    end
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def audition_request_params
      params.require(:audition_request).permit(:actor_id, :role_id, :accepted?)
    end
end
