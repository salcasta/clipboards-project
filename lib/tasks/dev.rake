desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  
  Order.delete_all
  Vendor.delete_all
  Item.delete_all
  Clipboard.delete_all
  Inventorysheet.delete_all
  User.delete_all

  User.create(
    email: "test@test.com",
    password: "password",
    general_manager_name: "Test Manager",
    organization_name: "Lalo's"
  )

  userID = User.first.id
 

  vendors = Array.new(5) do
    {
      company_name: Faker::Company.name,
      rep_name: Faker::Name.name,
      rep_email: Faker::Internet.email,
      rep_phone_number: Faker::PhoneNumber.phone_number,
    }
  end
  
  vendors.each do |vendor|
    Vendor.create(
      company_name: vendor[:company_name],
      rep_name: vendor[:rep_name],
      rep_email: vendor[:rep_email],
      rep_phone_number: vendor[:rep_phone_number],
      user_id: userID
    )
  end

  areas = ["bar", "produce", "meats", "paper goods", "dry goods"]

  areas.each do |area|
    Clipboard.create(
      area: area,
      user_id: userID
    )
  end

  dates = ["2024-04-14", "2024-04-07", "2024-03-31", "2024-03-24", "2024-03-17", "2024-03-10", "2024-03-03", "2024-02-25"]
  holiday_dates = ["2023-12-31", "2023-12-24", "2023-11-19", "2023-10-29", "2023-08-27", "2023-07-02", "2023-05-28"]

  dates.map! { |date| Date.parse(date) }

  bar_clipboard = Clipboard.find_by(area: "bar")
  other_clipboard_ids = Clipboard.where.not(id: bar_clipboard.id).pluck(:id)

  dates.each do |date|
    Inventorysheet.create(
      date: date,
      is_complete: false,
      is_holiday: false,
      clipboard_id: bar_clipboard.id,
      user_id: userID
    )
  end

  dates.each do |date|
    Inventorysheet.create(
      date: date,
      is_complete: false,
      is_holiday: false,
      clipboard_id: other_clipboard_ids.sample,
      user_id: userID
    )
  end

  holiday_dates.each do |date|
    Inventorysheet.create(
      date: date,
      is_complete: false,
      is_holiday: true,
      clipboard_id: bar_clipboard.id,
      user_id: userID
    )
  end

  Inventorysheet.where.not(date: "2024-04-14").update_all(is_complete: true)

  tequila_brands = ["Don Julio Blanco", "Don Julio Reposado", "Don Julio 1942", "Patron Silver", "Patron Reposado", "Espolon Blanco", "Espolon Reposado", "Casamigos Blanco", "Casamigos Reposado", "Casamigos Anejo", "Casamigos Mezcal", "Del Maguey Vida"]
  units = ["btl", "case"]

  tequila_brands.each_with_index do |tequila, index|
    unit = units.sample
    pack_size = unit == 'btl' ? 1 : 6
    price = rand(20..100)
    pack_cost = pack_size * price 

    Item.create(
      category: "Spirit",
      product_type: "Tequila",
      label: tequila,
      unit: unit,
      price: price,
      pack_size: pack_size,
      item_size: "750ml",
      pack_cost: pack_cost,
      area: "bar",
      vendor_id: rand(1..5),
      rank: index + 1,
      par_level: rand(10..20), 
      comment: rand < 0.25 ? Faker::Lorem.sentence : nil,
      user_id: userID
    )
  end

  bar_clipboard = Clipboard.find_by(area: "bar")
  bar_inventorysheets = Inventorysheet.where( clipboard_id: bar_clipboard.id)
  items = Item.all
 

  bar_inventorysheets.each do |inventorysheet|
    items.each do |item|
      Order.create(
        on_hand: rand(0..20),
        quantity: rand(0..10),
        inventory_sheets_id: inventorysheet.id,
        item_id: item.id,
        user_id: userID
      )
    end
  end


  p "There are now #{Vendor.count} vendors."
  p "There are now #{Clipboard.count} clipboards."
  p "There are now #{Inventorysheet.count} inventory sheets."
  p "There are now #{Item.count} items."
  p "There are now #{Order.count} orders."
  p "There are now #{User.count} users."
end
