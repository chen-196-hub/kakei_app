class Task < ApplicationRecord
  validates :content, {presence: true}
  validates :user_id, {presence: true}
end
