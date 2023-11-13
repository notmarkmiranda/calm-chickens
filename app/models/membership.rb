class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :pool

  enum role: { 'member': 0, 'admin': 1 }
  enum status: { 'pending': 0, 'active': 1, 'archived': 2 }
end
