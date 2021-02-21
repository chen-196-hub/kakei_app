class HouseholdController < ApplicationController
  def index
    @kakei = Household.find_by(id: 1)
    @totalincome = @kakei.income+@kakei.bonus
    @totalcost = @kakei.houst_ret+@kakei.living_cost+@kakei.water_rate+@kakei.power_rate+@kakei.gas_rate+@kakei.tel_bill+@kakei.net_bill+@kakei.traffic_bill
    @total = @totalincome - @totalcost
  end
end
