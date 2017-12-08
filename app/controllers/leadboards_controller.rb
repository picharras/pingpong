class LeadboardsController < ApplicationController
  before_action :set_leadboard, only: [:show, :edit, :update, :destroy]

  # GET /leadboards
  def index
    @leadboards = Leadboard.order('score DESC')
  end

  # GET /leadboards/1
  def show
  end

  # GET /leadboards/new
  def new
    @leadboard = Leadboard.new
  end

  # GET /leadboards/1/edit
  def edit
  end

  # POST /leadboards
  def create
    @leadboard = Leadboard.new(leadboard_params)

    if @leadboard.save
      redirect_to @leadboard, notice: 'Leadboard was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /leadboards/1
  def update
    if @leadboard.update(leadboard_params)
      redirect_to @leadboard, notice: 'Leadboard was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /leadboards/1
  def destroy
    @leadboard.destroy
    redirect_to leadboards_url, notice: 'Leadboard was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leadboard
      @leadboard = Leadboard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def leadboard_params
      params.require(:leadboard).permit(:user_id, :score, :games)
    end
end
