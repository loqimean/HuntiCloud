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
#  green_personality  :decimal(10, 2)   default(0.0)
#  last_name          :string
#  phone_number       :bigint
#  photo              :string           not null
#  red_personality    :decimal(10, 2)   default(0.0)
#  second_name        :string
#  yellow_personality :decimal(10, 2)   default(0.0)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  childhood_city_id  :bigint           not null
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
class Person < ApplicationRecord
  mount_uploader :photo, PersonPhotoUploader

  belongs_to :childhood_city, class_name: 'City'
  belongs_to :current_city, class_name: 'City'

  def full_name
    "#{first_name} #{last_name} #{second_name}"
  end
end
