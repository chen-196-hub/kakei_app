class GroupUser < ApplicationRecord
  validates :user_id, presence: true
  validates :group_id, presence: true
end
