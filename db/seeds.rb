puts 'Start creating admin user'
User.create!(first_name: 'Ivan', last_name: 'Admin', password: 'simplesimple', email: 'admin@mail.io')

puts 'Start creating regions'
regions = RegionsSeed.run

puts 'Start creating people'
regions.each do |region_name|
  city = FactoryBot.create(:city, region: Region.find_by(name: region_name))
  FactoryBot.create_list(:person, rand(0..10), current_city: city, childhood_city: city)
end

puts 'Seeding is done!'
