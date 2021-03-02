class ChangeHouseTable < ActiveRecord::Migration[6.1]
  def up
    change_column :households, :income, :integer, default: 0
    change_column :households, :bonus, :integer, default: 0
    change_column :households, :houst_ret, :integer, default: 0
    change_column :households, :living_cost, :integer, default: 0
    change_column :households, :water_rate, :integer, default: 0
    change_column :households, :power_rate, :integer, default: 0
    change_column :households, :gas_rate, :integer, default: 0
    change_column :households, :tel_bill, :integer, default: 0
    change_column :households, :net_bill, :integer, default: 0
    change_column :households, :traffic_bill, :integer, default: 0
  end

  def down
    change_column :households, :income, :string
    change_column :households, :bonus, :string
    change_column :households, :houst_ret, :string
    change_column :households, :living_cost, :string
    change_column :households, :water_rate, :string
    change_column :households, :power_rate, :string
    change_column :households, :gas_rate, :string
    change_column :households, :tel_bill, :string
    change_column :households, :net_bill, :string
    change_column :households, :traffic_bill, :string
  end
end
