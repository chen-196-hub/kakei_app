class AddGroupsCreatedUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :user_id, :string
  end
end
