users = ['inigo', 'edrizio', 'picharras']
users.each do |u|
  User.create!(email: "#{u}@regalii.com", password: 'secret123')
end
puts "-- Added #{users.size} users to your database"
