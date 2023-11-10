class Pool < ApplicationRecord
  belongs_to :superadmin, class_name: "User", foreign_key: "user_id"
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  validate :start_datetime_over_one_day_away

  private

  def start_datetime_over_one_day_away
    if start_datetime.present? && (start_datetime < 24.hours.from_now)
      errors.add(:start_datetime, "must be greater than 24 hours in the future")
    end
  end
end
