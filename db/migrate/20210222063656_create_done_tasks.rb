class CreateDoneTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :done_tasks do |t|
      t.text :content
      t.string :user_id

      t.timestamps
    end
  end
end
