class MembershipsController < ApplicationController
  before_action :require_user

  def index
    @memberships = current_user.memberships.includes(:pool)
    @superadmin_pools = current_user.pools
  end
end