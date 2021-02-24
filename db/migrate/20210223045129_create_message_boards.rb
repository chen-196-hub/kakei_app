class CreateMessageBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :message_boards do |t|
      t.text :content
      t.string :user_id
      t.string :group_id

      t.timestamps
    end
  end
end
