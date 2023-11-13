class Pool < ApplicationRecord
  belongs_to :superadmin, class_name: "User", foreign_key: "user_id"
  has_many :memberships
  has_many :member_memberships, -> { where(role: 0) }, class_name: "Membership"
  has_many :members, through: :member_memberships, source: :user
  has_many :admin_memberships, -> { where(role: 1) }, class_name: "Membership"
  has_many :admins, through: :admin_memberships, source: :user

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validate :start_datetime_over_one_day_away

  private

  def start_datetime_over_one_day_away
    if start_datetime.present? && (start_datetime < 24.hours.from_now)
      errors.add(:start_datetime, "must be greater than 24 hours in the future")
    end
  end
end
