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
class Person < ApplicationRecord
  GENDERS = { man: 0, woman: 1 }.freeze

  enum gender: GENDERS

  mount_uploader :photo, PersonPhotoUploader

  belongs_to :childhood_city, class_name: 'City', optional: true
  belongs_to :current_city, class_name: 'City'

  validates :first_name, :gender, :photo, presence: true
  validates :gender, inclusion: { in: HashWithIndifferentAccess.new(GENDERS).keys }

  scope :ordered, ->{ order(:first_name) }
  after_initialize :set_default_picture

  def full_name
    "#{first_name} #{last_name} #{second_name}"
  end

  def set_default_picture
    return if self.photo.present?

    self.photo = FakePicture::Avatar.file(gender&.to_sym || GENDERS.keys.sample)
  end
end
