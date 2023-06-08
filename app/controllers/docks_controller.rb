class DocksController < ApplicationController
  before_action :set_dock, only: %i[ show edit update destroy ]

  # GET /docks or /docks.json
  def index
    @docks = Dock.all
  end

  # GET /docks/1 or /docks/1.json
  def show
  end

  # GET /docks/new
  def new
    @dock = Dock.new
  end

  # GET /docks/1/edit
  def edit
  end

  # POST /docks or /docks.json
  def create
    @dock = Dock.new(dock_params)

    respond_to do |format|
      if @dock.save
        format.html { redirect_to dock_url(@dock), notice: "Dock was successfully created." }
        format.json { render :show, status: :created, location: @dock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /docks/1 or /docks/1.json
  def update
    respond_to do |format|
      if @dock.update(dock_params)
        format.html { redirect_to dock_url(@dock), notice: "Dock was successfully updated." }
        format.json { render :show, status: :ok, location: @dock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docks/1 or /docks/1.json
  def destroy
    @dock.destroy

    respond_to do |format|
      format.html { redirect_to docks_url, notice: "Dock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dock
      @dock = Dock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dock_params
      params.require(:dock).permit(:title, :user_id)
    end
end
