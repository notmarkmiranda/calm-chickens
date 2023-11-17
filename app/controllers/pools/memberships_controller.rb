module Pools
  class MembershipsController < ApplicationController
    before_action :set_pool, :require_user

    def index
      @pool = Pool.includes(:members, :admins).find(params[:pool_id])
    end

    def new
      @pool = Pool.find(params[:pool_id])
      @membership = @pool.memberships.new
      authorize [:pools, @membership]
      @membership.build_user
    end

    def create
      @membership = user_exists? ? membership_for_existing_user : membership_for_new_user
      authorize [:pools, @membership]
      if @membership.save
        flash[:notice] = "Member Invited"
      else
        flash[:alert] = @membership.errors.full_messages.join(", ")
      end
      redirect_to pool_memberships_path(@pool)
    end

    private

    def set_pool
      @pool = Pool.find(params[:pool_id])
    end

    def membership_for_existing_user
      membership = Membership.new(membership_only_params)
      membership.user = @user
      membership
    end

    def membership_for_new_user
      membership = Membership.new(membership_params)
      membership.randomize_user_password
      membership
    end

    def user_exists?
      @user = User.find_by(email: membership_params[:user_attributes][:email])
      @user.present?
    end

    def membership_only_params
      params.require(:membership).permit(:pool_id)
    end

    def membership_params
      params.require(:membership).permit(
        :pool_id,
        user_attributes: [:id, :email, :first_name, :last_name, :nickname]
      )
    end
  end
end