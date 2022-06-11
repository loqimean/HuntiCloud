# == Schema Information
#
# Table name: profits
#
#  id                           :bigint           not null, primary key
#  amount                       :decimal(, )      not null
#  daily_expences               :decimal(, )
#  funds_for_expensive_purchase :decimal(, )
#  funds_for_others             :decimal(, )
#  funds_for_self_development   :decimal(, )
#  investment_funds             :decimal(, )
#  savings                      :decimal(, )
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  envelope_formula_id          :bigint
#  user_id                      :bigint           not null
#
# Indexes
#
#  index_profits_on_envelope_formula_id  (envelope_formula_id)
#  index_profits_on_user_id              (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (envelope_formula_id => envelope_formulas.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :profit do
    amount { "9.99" }
    daily_expences { "9.99" }
    funds_for_expensive_purchase { "9.99" }
    funds_for_others { "9.99" }
    funds_for_self_development { "9.99" }
    investment_funds { "9.99" }
    savings { "9.99" }

    user
    envelope_formula

    trait :invalid do
      amount { nil }
    end
  end
end
