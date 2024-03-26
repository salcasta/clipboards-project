json.extract! item, :id, :category, :product_type, :label, :unit, :price, :pack_size, :item_size, :pack_cost, :user_id, :area, :vendor_id, :inventory_sheets_id, :rank, :par_level, :comment :created_at, :updated_at
json.url item_url(item, format: :json)
