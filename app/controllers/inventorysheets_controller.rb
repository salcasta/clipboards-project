class InventorysheetsController < ApplicationController
  before_action :set_inventorysheet, only: %i[ show edit update destroy ]
  before_action { authorize @inventorysheet|| Inventorysheet }

  # GET /inventorysheets or /inventorysheets.json
  def index
    if params[:clipboard_id]
      @inventorysheets = current_user.inventorysheets.where(clipboard_id: params[:clipboard_id]).order(date: :desc)
    else
      @inventorysheets = current_user.inventorysheets.all.order(date: :desc)
    end    
  end

  # GET /inventorysheets/1 or /inventorysheets/1.json
  def show
    @inventorysheet = Inventorysheet.find(params[:id])
    @items = current_user.items.where(area: @inventorysheet.clipboard.area).order(rank: :asc).page(params[:items_page]).per(10)
    @clipboard = @inventorysheet.clipboard
    @items_ordered = @inventorysheet.orders.includes(:item).page(params[:items_ordered_page]).per(10)
  end

  # GET /inventorysheets/new
  def new
    @inventorysheet = Inventorysheet.new
    @clipboards = current_user.clipboards
  end

  # GET /inventorysheets/1/edit
  def edit
    @clipboards = Clipboard.all
    @clipboard = @inventorysheet.clipboard
  end

  # POST /inventorysheets or /inventorysheets.json
  def create
    @inventorysheet = Inventorysheet.new(inventorysheet_params)

    respond_to do |format|
      if @inventorysheet.save
        format.html { redirect_to inventorysheet_url(@inventorysheet), notice: "Inventory sheet was successfully created." }
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
        format.html { redirect_to inventorysheet_url(@inventorysheet), notice: "Inventory sheet was successfully updated." }
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
      format.html { redirect_to inventorysheets_url, notice: "Inventory sheet was successfully destroyed." }
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
      params.require(:inventorysheet).permit(:date, :is_holiday, :is_complete, :user_id, :clipboard_id)
    end
end
