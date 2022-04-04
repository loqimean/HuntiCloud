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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  has_many :galleries, dependent: :destroy
  has_many :partner_request, dependent: :destroy

  scope :pending_partner_requests, -> { partner_request.where(status: :pending) }

  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 50 }

  def pending_invite_partner_request(candidate_id)
    PartnerRequest.find_by(status: :pending, invited: self, user_id: candidate_id)
  end

  def approved_partner_request(candidate_id)
    PartnerRequest.find_by(status: :approved, invited: self, user_id: candidate_id)
  end

  # -----------------------

  # when itself follows
  def following?(user_id)
    PartnerRequest.exists?(status: 'approved', user_id: id, invited: user_id)
  end

  # when other user followed me
  def follower?(user_id)
    PartnerRequest.exists?(status: 'approved', user_id: user_id, invited: id)
  end

  def has_request?(user)
    PartnerRequest.exists?(status: 'pending', user_id: id, invited: user.id)
  end
end
