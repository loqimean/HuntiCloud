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
require 'rails_helper'

RSpec.describe EnvelopeFormula, type: :model do
  describe '#validations' do
    [:name, :daily_expences, :funds_for_expensive_purchase, :funds_for_others,
      :funds_for_self_development, :investment_funds, :savings].each do |field|
      it { is_expected.to validate_presence_of(field) }
    end

    it { is_expected.to belong_to(:user) }
  end
end
