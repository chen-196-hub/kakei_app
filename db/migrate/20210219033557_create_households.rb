class CreateHouseholds < ActiveRecord::Migration[6.1]
  def change
    create_table :households do |t|
      t.integer :income
      t.integer :bonus
      t.integer :houst_ret
      t.integer :living_cost
      t.integer :water_rate
      t.integer :power_rate
      t.integer :gas_rate
      t.integer :tel_bill
      t.integer :net_bill
      t.integer :traffic_bill

      t.timestamps
    end
  end
end
