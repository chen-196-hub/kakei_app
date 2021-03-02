class HouseholdController < ApplicationController
  before_action :set_current_user
  before_action :authenticate_user, { only: %i[index edit update] }
  def index
    @kakei = Household.find_by(id: session[:user_id])
    @totalincome = @kakei.income + @kakei.bonus
    @totalcost = @kakei.houst_ret + @kakei.living_cost + @kakei.water_rate + @kakei.power_rate + @kakei.gas_rate + @kakei.tel_bill + @kakei.net_bill + @kakei.traffic_bill
    @total = @totalincome - @totalcost
  end

  def edit
    @kakei = Household.find_by(id: session[:user_id])
  end

  def update
    @kakei = Household.find_by(id: session[:user_id])
    @kakei.income = params[:income]
    @kakei.bonus = params[:bonus]
    @kakei.houst_ret = params[:houst_ret]
    @kakei.living_cost = params[:living_cost]
    @kakei.water_rate = params[:water_rate]
    @kakei.power_rate = params[:power_rate]
    @kakei.gas_rate = params[:gas_rate]
    @kakei.tel_bill = params[:tel_bill]
    @kakei.net_bill = params[:net_bill]
    @kakei.traffic_bill = params[:traffic_bill]
    if @kakei.save
      flash[:notice] = '家計情報を編集しました'
      redirect_to('/household/index')
    else
      render('household/edit')
    end
  end
end
