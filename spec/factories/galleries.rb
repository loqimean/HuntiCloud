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
FactoryBot.define do
  factory :gallery do
    user
    file { FakePicture::Blog.file(:preview) }
  end
end
