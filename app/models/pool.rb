class Pool < ApplicationRecord
  belongs_to :superadmin, class_name: "User", foreign_key: "user_id"
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
