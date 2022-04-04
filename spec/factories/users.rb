# == Schema Information
#
# Table name: users
#
#  id                  :bigint           not null, primary key
#  current_sign_in_at  :datetime
#  current_sign_in_ip  :string
#  email               :string           not null
#  encrypted_password  :string           not null
#  first_name          :string           not null
#  last_name           :string           not null
#  last_sign_in_at     :datetime
#  last_sign_in_ip     :string
#  partner_ids         :integer          default([]), not null, is an Array
#  remember_created_at :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Internet.password }
  end
end
