# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class City < ApplicationRecord
  CHILDHOOD_CITY = 'ChildhoodCity'.freeze
  CURRENT_CITY = 'CurrentCity'.freeze
  DEFAULT = 'City'.freeze

  has_many :people
end
