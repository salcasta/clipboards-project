desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  
  #Order.delete_all
  Vendor.delete_all
  #Item.delete_all
  #Inventorysheet.delete_all
  #Clipboard.delete_all

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
      rep_phone_number: vendor[:rep_phone_number]
    )
  end

  areas = ["bar", "produce", "meats", "paper goods", "dry goods"]

  areas.each do |area|
    Clipboard.create(
      area: area,
      user_id: 2
    )
  end

  dates = ["2024,14,04", "2024,07,04", "2024,31,03", "2024,24,03", "2024,24,03", "2024,17,03", "2024,10,03", "2024,03,03"]

  dates.each do |date|
    Inventorysheet.create(
      date: date,
      is_complete: false,
      is_holiday: false,
      clipboard_id: 1,
      user_id: 2
    )

  dates.each do |date|
    Inventorysheet.create(
      date: date,
      is_complete: false,
      is_holiday: false,
      clipboard_id: rand(2..5),
      user_id: 2
    )

  Inventorysheet.where.not(date: "2024,14,04").update_all(is_complete: true)


  p "There are now #{Vendor.count} vendors."
  p "There are now #{Clipboard.count} clipboards."
  p "There are now #{Inventorysheet.count} inventory sheets."
end


#  id           :integer          not null, primary key
#  date         :date
#  is_complete  :boolean
#  is_holiday   :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  clipboard_id :integer
#  item_id      :integer
#  user_id      :integer
