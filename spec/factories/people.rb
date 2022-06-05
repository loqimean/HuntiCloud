# == Schema Information
#
# Table name: people
#
#  id                 :bigint           not null, primary key
#  birthday           :datetime
#  blue_personality   :decimal(10, 2)   default(0.0)
#  characteristic     :text
#  email              :string
#  first_name         :string
#  gender             :integer
#  green_personality  :decimal(10, 2)   default(0.0)
#  instagram_url      :string
#  last_name          :string
#  phone_number       :bigint
#  photo              :string           not null
#  red_personality    :decimal(10, 2)   default(0.0)
#  second_name        :string
#  telegram           :string
#  yellow_personality :decimal(10, 2)   default(0.0)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  childhood_city_id  :bigint
#  current_city_id    :bigint           not null
#
# Indexes
#
#  index_people_on_childhood_city_id  (childhood_city_id)
#  index_people_on_current_city_id    (current_city_id)
#
# Foreign Keys
#
#  fk_rails_...  (childhood_city_id => cities.id)
#  fk_rails_...  (current_city_id => cities.id)
#
FactoryBot.define do
  factory :person do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    second_name { Faker::Name.middle_name }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.phone_number }
    blue_personality { Faker::Number.between(from: 0.0, to: 1.0) }
    green_personality { Faker::Number.between(from: 0.0, to: 1.0) }
    red_personality { Faker::Number.between(from: 0.0, to: 1.0) }
    yellow_personality { Faker::Number.between(from: 0.0, to: 1.0) }
    gender { Person::GENDERS.keys.sample }
    characteristic { Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false) }
    birthday { 17.years.ago }

    association :childhood_city, factory: :city
    association :current_city, factory: :city
  end
end
