class HolidayController < ApplicationController

  def index
    @inventorysheets = current_user.inventorysheets.where(is_holiday: true).order(date: :desc)
  end

end
