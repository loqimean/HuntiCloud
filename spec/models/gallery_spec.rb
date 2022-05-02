# == Schema Information
#
# Table name: galleries
#
#  id             :bigint           not null, primary key
#  count_of_views :integer          default(0), not null
#  favorite       :boolean          default(FALSE), not null
#  file           :string           not null
#  removed        :boolean          default(FALSE), not null
#  share          :boolean          default(TRUE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint
#
# Indexes
#
#  index_galleries_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Gallery, type: :model do
  describe '#relations' do
    it { is_expected.to belong_to(:user) }
  end

  describe '#callbacks' do
    let!(:gallery) { build(:gallery) }
    let(:exifr_date_result) { double(date_time: Date.yesterday) }

    context 'with :set_metadata' do
      it 'sets picture\'s creation date' do
        allow(EXIFR::JPEG).to receive(:new).and_return(exifr_date_result)

        gallery.run_callbacks(:create)

        expect(gallery.created_at).to eq(Date.yesterday.strftime('%Y.%m.%d %I:%M%P'))
      end
    end
  end
end
