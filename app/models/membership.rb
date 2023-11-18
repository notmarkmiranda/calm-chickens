class Membership < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user
  belongs_to :pool
  delegate :name, to: :pool, prefix: true

  enum role: { 'member': 0, 'admin': 1 }
  enum status: { 'pending': 0, 'active': 1, 'inactive': 2 }

  def randomize_user_password
    user.password = SecureRandom.hex
  end
end
