class ClipboardsController < ApplicationController
  before_action :set_clipboard, only: %i[ show edit update destroy ]

  # GET /clipboards or /clipboards.json
  def index
    @clipboards = Clipboard.all
  end

  # GET /clipboards/1 or /clipboards/1.json
  def show
  end

  # GET /clipboards/new
  def new
    @clipboard = Clipboard.new
  end

  # GET /clipboards/1/edit
  def edit
  end

  # POST /clipboards or /clipboards.json
  def create
    @clipboard = Clipboard.new(clipboard_params)

    respond_to do |format|
      if @clipboard.save
        format.html { redirect_to clipboards_url, notice: "Clipboard was successfully created." }
        format.json { render :show, status: :created, location: @clipboard }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clipboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clipboards/1 or /clipboards/1.json
  def update
    respond_to do |format|
      if @clipboard.update(clipboard_params)
        format.html { redirect_to clipboard_url(@clipboard), notice: "Clipboard was successfully updated." }
        format.json { render :show, status: :ok, location: @clipboard }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clipboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clipboards/1 or /clipboards/1.json
  def destroy
    @clipboard.destroy

    respond_to do |format|
      format.html { redirect_to clipboards_url, notice: "Clipboard was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clipboard
      @clipboard = Clipboard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clipboard_params
      params.require(:clipboard).permit(:area, :user_id)
    end
end
