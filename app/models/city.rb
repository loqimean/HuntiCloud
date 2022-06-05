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
end
