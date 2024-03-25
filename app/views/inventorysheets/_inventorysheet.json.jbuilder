json.extract! inventorysheet, :id, :date, :is_holiday, :is_complete, :user_id, :clipboard_id, :items_count, :orders_count, :created_at, :updated_at
json.url inventorysheet_url(inventorysheet, format: :json)
