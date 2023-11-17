# frozen_string_literal: true

module Pools
  class MembershipPolicy < ::ApplicationPolicy
    def new?
      user_is_admin?(record.pool, user)
    end

    def create?
      user_is_admin?(record.pool, user)
    end

    private

    def user_is_admin?(pool, user)
      user == pool.superadmin || pool.admins.include?(user)
    end
  end
end