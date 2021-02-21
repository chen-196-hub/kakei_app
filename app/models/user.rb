class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, {presence: true}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, uniqueness: true}
  validates :email, format:{ with: VALID_EMAIL_REGEX }
  # ,uniqueness: true
  #1空欄でないこと２被らないこと
  has_secure_password
  validates :password, {presence: true}
  validates :password, length:{minimum:6}
end
