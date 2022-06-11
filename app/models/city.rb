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
class City < ApplicationRecord
  CHILDHOOD_CITY = 'ChildhoodCity'.freeze
  CURRENT_CITY = 'CurrentCity'.freeze
  DEFAULT = 'City'.freeze

  belongs_to :region
  has_many :people, dependent: :restrict_with_exception

  scope :ordered, ->{ order(:name) }
  scope :with_people_for_current_city, ->{ joins('INNER JOIN "people" ON "people"."current_city_id" = "cities"."id"').distinct }
  scope :with_people_for_childhood_city, ->{ joins('INNER JOIN "people" ON "people"."childhood_city_id" = "cities"."id"').distinct }
end
