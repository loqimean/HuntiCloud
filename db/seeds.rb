puts 'Start creating admin user'
User.create!(first_name: 'Ivan', last_name: 'Admin', password: 'simplesimple', email: 'admin@mail.io')
puts 'Seeding is done!'
