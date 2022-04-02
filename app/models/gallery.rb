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
class Gallery < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :user

  scope :ordered, -> { where(removed: false).order(created_at: :desc) }

  before_create :set_metadata

  private

  def set_metadata
    uploaded_file = file

    if uploaded_file.content_type == 'image/jpeg'
      creation_date = EXIFR::JPEG.new(uploaded_file.file.file).date_time

      self.created_at = creation_date.strftime('%Y.%m.%d %I:%M%P') unless creation_date.nil?
    end
  end
end
