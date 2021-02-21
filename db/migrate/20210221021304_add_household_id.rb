class AddHouseholdId < ActiveRecord::Migration[6.1]
  def change
    add_column :households, :user_id, :integer
  end
end
