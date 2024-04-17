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

  p "There are now #{Vendor.count} vendors."
end
