class InventorysheetsController < ApplicationController
  before_action :set_inventorysheet, only: %i[ show edit update destroy ]

  # GET /inventorysheets or /inventorysheets.json
  def index
    @inventorysheets = Inventorysheet.all
  end

  # GET /inventorysheets/1 or /inventorysheets/1.json
  def show
  end

  # GET /inventorysheets/new
  def new
    @inventorysheet = Inventorysheet.new
  end

  # GET /inventorysheets/1/edit
  def edit
  end

  # POST /inventorysheets or /inventorysheets.json
  def create
    @inventorysheet = Inventorysheet.new(inventorysheet_params)

    respond_to do |format|
      if @inventorysheet.save
        format.html { redirect_to inventorysheet_url(@inventorysheet), notice: "Inventorysheet was successfully created." }
        format.json { render :show, status: :created, location: @inventorysheet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventorysheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventorysheets/1 or /inventorysheets/1.json
  def update
    respond_to do |format|
      if @inventorysheet.update(inventorysheet_params)
        format.html { redirect_to inventorysheet_url(@inventorysheet), notice: "Inventorysheet was successfully updated." }
        format.json { render :show, status: :ok, location: @inventorysheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventorysheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventorysheets/1 or /inventorysheets/1.json
  def destroy
    @inventorysheet.destroy

    respond_to do |format|
      format.html { redirect_to inventorysheets_url, notice: "Inventorysheet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventorysheet
      @inventorysheet = Inventorysheet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventorysheet_params
      params.require(:inventorysheet).permit(:date, :is_holiday, :is_complete, :user_id, :clipboard_id, :items_count, :orders_count)
    end
end
