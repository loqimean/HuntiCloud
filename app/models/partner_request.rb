# == Schema Information
#
# Table name: partner_requests
#
#  id         :bigint           not null, primary key
#  status     :string           default("pending"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  invited_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_partner_requests_on_invited_id  (invited_id)
#  index_partner_requests_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (invited_id => users.id)
#  fk_rails_...  (user_id => users.id)
#
class PartnerRequest < ApplicationRecord
  PENDING = 'approved'.freeze
  APPROVED = 'approved'.freeze
  DENIED = 'denied'.freeze
  REMOVED = 'removed'.freeze

  belongs_to :inviter, class_name: 'User', foreign_key: 'user_id'
  belongs_to :invited, class_name: 'User', foreign_key: 'invited_id'

  validates_uniqueness_of :user_id, conditions: lambda { |partner_request|
                                                  where(status: 'pending', user_id: partner_request.user_id, invited_id: partner_request.invited_id)
                                                }, message: 'Request has been already created'
  validates_uniqueness_of :user_id, conditions: lambda { |partner_request|
                                                  where(status: 'approved', user_id: partner_request.user_id)
                                                }, message: 'Request has been already approved'

  def approve!
    update!(status: APPROVED)
  end

  def deny!
    update!(status: DENIED)
  end

  def remove!
    update!(status: REMOVED)
  end
end
