class PoolsController < ApplicationController
  before_action :require_user, only: [:new]

  def show
    @pool = Pool.find(params[:id])
  end

  def new
    @pool = current_user.pools.new
  end

  def create
    @pool = current_user.pools.new(pool_params)
    if @pool.save
      flash[:notice] = "Pool created!"
      redirect_to @pool
    else
      flash[:alert] = @pool.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def pool_params
    params.require(:pool).permit(:user_id, :name, :start_datetime, :status, :private)
  end
end