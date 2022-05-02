# == Schema Information
#
# Table name: envelope_formulas
#
#  id                           :bigint           not null, primary key
#  daily_expences               :decimal(10, 2)   not null
#  funds_for_expensive_purchase :decimal(10, 2)   not null
#  funds_for_others             :decimal(10, 2)   not null
#  funds_for_self_development   :decimal(10, 2)   not null
#  investment_funds             :decimal(10, 2)   not null
#  name                         :string           not null
#  savings                      :decimal(10, 2)   not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  user_id                      :bigint           not null
#
# Indexes
#
#  index_envelope_formulas_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :envelope_formula do
    name { Faker::Book.title }
    daily_expences { Faker::Number.between(from: 0.0, to: 1.0) }
    savings { Faker::Number.between(from: 0.0, to: 1.0) }
    funds_for_others { Faker::Number.between(from: 0.0, to: 1.0) }
    funds_for_self_development { Faker::Number.between(from: 0.0, to: 1.0) }
    funds_for_expensive_purchase { Faker::Number.between(from: 0.0, to: 1.0) }
    investment_funds { Faker::Number.between(from: 0.0, to: 1.0) }

    user

    trait :invalid do
      name { '' }
    end
  end
end
