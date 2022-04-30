# == Schema Information
#
# Table name: regions
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Region < ApplicationRecord
  has_many :cities, dependent: :restrict_with_exception

  validates :name, presence: true
  validates :name, uniqueness: true
end
