require 'faker'

# Create sample data for the contacts table
10.times do
  Contact.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end

# Create sample data for the users table
# Define sample email addresses and passwords
users_data = [
  { email: 'user1@example.com', password: 'password1' },
  { email: 'user2@example.com', password: 'password2' },
  { email: 'user3@example.com', password: 'password3' },
]

users_data.each do |user_data|
  user = User.new(
    email: user_data[:email],
    password: user_data[:password]
  )
  user.save(validate: false)
end
