module Pools
  class MembershipsController < ApplicationController
    def index
      @pool = Pool.includes(:members, :admins).find(params[:pool_id])
    end
  end
end