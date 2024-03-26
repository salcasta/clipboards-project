json.extract! order, :id, :item_id, :inventory_sheets_id, :quantity, :on_hand, :created_at, :updated_at
json.url order_url(order, format: :json)
