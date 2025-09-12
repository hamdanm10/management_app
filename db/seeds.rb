users = [
  {
    first_name: "Super",
    last_name: "Admin",
    email_address: "super_admin@gmail.com",
    password: "asdfasdf",
    user_type: :super_admin
  }
]

users.each do |attrs|
  user = User.find_or_initialize_by(email_address: attrs[:email_address])
  user.assign_attributes(
    first_name: attrs[:first_name],
    last_name:  attrs[:last_name],
    password:   attrs[:password],
    user_type:  attrs[:user_type]
  )
  user.save!
  puts "#{user.email_address} successfully created or updated."
end

Finance.first_or_create!(
  production_cost: 0.00,
  net_profit: 0.00
)
puts "Finance successfully created or found."
