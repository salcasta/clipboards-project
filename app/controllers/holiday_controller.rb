class HolidayController < ApplicationController

  def index
    @inventorysheets = Inventorysheet.where(is_holiday: true).order(date: :desc)
  end

end
