class Household < ApplicationRecord
  # validates :income, {presence: true}
  # validates :bonus, {presence: true}
  # validates :houst_ret, {presence: true}
  # validates :income, {presence: true}
  # validates :income, {presence: true}
  # validates :income, {presence: true}
  # validates :income, {presence: true}
  validates_presence_of :income,:bonus,:houst_ret,:living_cost,:water_rate,:power_rate,:gas_rate,:tel_bill,:net_bill,:traffic_bill
end
