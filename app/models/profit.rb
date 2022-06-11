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
class Profit < ApplicationRecord
  belongs_to :user
  belongs_to :envelope_formula

  scope :ordered, ->{ order(created_at: :desc) }
end
