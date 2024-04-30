class HolidayController < ApplicationController

  def index
    @inventorysheets = current_user.inventorysheets.where(is_holiday: true).order(date: :desc).page(params[:items_ordered_page]).per(10)
  end

end
