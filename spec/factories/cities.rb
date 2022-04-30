# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region_id  :bigint
#
# Indexes
#
#  index_cities_on_region_id  (region_id)
#
FactoryBot.define do
  factory :city do
    region
    name { Faker::Address.city }
  end
end
